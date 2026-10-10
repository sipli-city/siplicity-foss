package siplicity

import (
	"slices"
)

type tree struct {
	root     int32
	parents  map[int32]int32
	children map[int32][]int32
}

func newTree(root int32) *tree {
	return &tree{
		root,
		make(map[int32]int32),
		make(map[int32][]int32),
	}
}

func (t *tree) count() int {
	return len(t.parents) + 1 // the root node has no parent but should be included in the count
}

func (t *tree) purge() {
	for k := range t.parents {
		delete(t.parents, k)
	}
	for k := range t.children {
		delete(t.children, k)
	}
}

func (t *tree) link(parent, child int32) {
	t.parents[child] = parent
	t.children[parent] = append(t.children[parent], child)
}

func (t *tree) adopt(old, new int32) {
	t.children[new] = t.children[old]
	t.children[new] = slices.DeleteFunc(t.children[new], func(e int32) bool { return e == new })
	for _, id := range t.children[new] {
		t.parents[id] = new
	}
	t.children[old] = []int32{new}
}

// links a list of nodes to a single parent
func (t *tree) linkList(parent int32, children []int32) {
	for _, child := range children {
		t.parents[child] = parent
	}
	t.children[parent] = append(t.children[parent], children...)
}

func (t *tree) unlinkDescendants(descendants []int32) {
	for _, d := range descendants {
		t.unlinkDescendants(t.children[d])
		delete(t.parents, d)
		delete(t.children, d)
	}
}

func (t *tree) unlink(node int32) {
	t.unlinkDescendants(t.children[node])
	delete(t.children, node)
	parent, ok := t.parents[node]
	if ok {
		t.children[parent] = slices.DeleteFunc(t.children[parent], func(v int32) bool { return node == v })
		delete(t.parents, node)
	}
}

func (t *tree) unlinkList(nodes []int32) {
	// shortcut if we can drop the entire list
	if t.count() == len(nodes) {
		t.purge()
		return
	}
	// separate the leaves and branches
	leaves, branchlen := make(map[int32]int32), make(map[int32]int)
	for _, n := range nodes {
		if len(t.children[n]) == 0 {
			leaves[n] = t.parents[n] // link to branch
		} else {
			branchlen[n] = len(t.children[n])
		}
	}
	for _, parent := range leaves {
		branchlen[parent] -= 1
		if branchlen[parent] == 0 {
			// drop leaves when parent is empty - as unlink will drop descendants
			for _, node := range t.children[parent] {
				delete(leaves, node)
			}
			// recursively drop children of parents when no kids left
			for {
				grandparent, ok := t.parents[parent]
				_, present := branchlen[grandparent]
				if !ok || !present {
					break
				}
				branchlen[grandparent] -= 1
				if branchlen[grandparent] == 0 {
					for _, branch := range t.children[grandparent] {
						delete(branchlen, branch)
					}
				} else {
					break
				}
				parent = grandparent
			}
		}
	}
	// now we should have leaves that can be deleted whose parents can't, and branches to drop entirely (zero children). Keep any branches that have children
	for key, len := range branchlen {
		if len == 0 {
			t.unlink(key)
		}
	}
	for key := range leaves {
		t.unlink(key)
	}
}

func (t *tree) flipRoot(fromRoot int32) {
	for _, v := range t.children[fromRoot] {
		t.parents[v] = t.root
	}
	t.children[t.root] = t.children[fromRoot]
	delete(t.children, fromRoot)
}

func (t *tree) copy(from *tree, parent int32, nodes []int32) {
	set := make(map[int32]bool)
	for _, n := range nodes {
		if n != from.root {
			set[n] = true
		}
	}
	for _, n := range nodes {
		if set[from.parents[n]] {
			t.link(from.parents[n], n)
		} else {
			t.link(parent, n)
		}
	}
}

func (t *tree) shift(from *tree, parent int32, nodes []int32) {
	// switch if full transfer onto a blank slate - but update roots
	if t.count() == 1 && from.count() == len(nodes) {
		copyParents, copyChildren := t.parents, t.children
		t.parents, t.children = from.parents, from.children
		t.flipRoot(from.root)
		from.parents, from.children = copyParents, copyChildren
		from.flipRoot(t.root)
		return
	}
	t.copy(from, parent, nodes)
	from.unlinkList(nodes)
}

// given a set of IDs, return a subset of the tree's "children" hierarchy
func (t *tree) hierarchy(ids []int32) map[int32][]int32 {
	ret := make(map[int32][]int32)
	var parent int32
outer:
	for _, id := range ids {
		for {
			parent = t.parents[id]
			if _, ok := ret[parent]; ok {
				if !slices.Contains(ret[parent], id) {
					ret[parent] = append(ret[parent], id)
				}
				continue outer // our parent has already been added, so ancestors must also have been visited
			}
			ret[parent] = make([]int32, 1, 20)
			ret[parent][0] = id
			if parent == t.root {
				continue outer
			}
			id = parent
		}

	}
	return ret
}
