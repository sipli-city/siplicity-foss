package siplicity

import "testing"

var TEST_TREE = &tree{
	root: 1,
	parents: map[int32]int32{
		2: 1,
		3: 1,
		4: 1,
		5: 2,
		6: 2,
		7: 5,
		8: 5,
		9: 3,
	},
	children: map[int32][]int32{
		1: {2, 3, 4},
		2: {5, 6},
		5: {7, 8},
		3: {9},
	},
}

func TestNth(t *testing.T) {
	var id int32 = 1
	_, id = TEST_TREE.nth(7, 0, id)
	if id != 9 {
		t.Fatalf("expected 7, got %d", id)
	}
	id = 1
	_, id = TEST_TREE.nth(0, 0, id)
	if id != 1 {
		t.Fatalf("expected 1, got %d", id)
	}
	id = 1
	_, id = TEST_TREE.nth(9, 0, id)
	if id != 0 {
		t.Fatalf("expected to fail with 0, got %d", id)
	}
}

func TestPage(t *testing.T) {
	PAGESZ = 3
	pg := TEST_TREE.page(2)
	if len(pg) != PAGESZ {
		t.Fatalf("pg is wrong size, got %d", len(pg))
	}
	if pg[0] != 8 || pg[1] != 6 || pg[2] != 3 {
		t.Fatalf("pg has wrong contents got %v", pg)
	}
	first := TEST_TREE.page(1)
	if len(first) != PAGESZ {
		t.Fatalf("first is wrong size, got %d", len(first))
	}
	if first[0] != 2 || first[1] != 5 || first[2] != 7 {
		t.Fatalf("first has wrong contents got %v", first)
	}
	last := TEST_TREE.page(3)
	if len(last) != 2 {
		t.Fatalf("first is wrong size, got %d", len(last))
	}
	if last[0] != 9 || last[1] != 4 {
		t.Fatalf("last has wrong contents got %v", last)
	}
	finished := TEST_TREE.page(4)
	if finished != nil {
		t.Fatal("finished is not nil")
	}
}

func TestCount(t *testing.T) {
	count := TEST_TREE.count()
	if count != 9 {
		t.Fatalf("expecting 9, got %d", count)
	}
}

func TestHierarchy(t *testing.T) {
	hierarchy := TEST_TREE.hierarchy([]int32{6, 3, 9, 4})
	if len(hierarchy[1]) != 3 {
		t.Fatalf("test hierarchy failed, expected 3 got %d, contents %v", len(hierarchy[1]), hierarchy[1])
	}
	if len(hierarchy[2]) != 1 || hierarchy[2][0] != 6 {
		t.Fatalf("test hierarchy failed, expected 6 as contents, got %v", hierarchy[2])
	}
}
