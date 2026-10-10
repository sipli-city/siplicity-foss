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

func TestHierarchy(t *testing.T) {
	hierarchy := TEST_TREE.hierarchy([]int32{6, 3, 9, 4})
	if len(hierarchy[1]) != 3 {
		t.Fatalf("test hierarchy failed, expected 3 got %d, contents %v", len(hierarchy[1]), hierarchy[1])
	}
	if len(hierarchy[2]) != 1 || hierarchy[2][0] != 6 {
		t.Fatalf("test hierarchy failed, expected 6 as contents, got %v", hierarchy[2])
	}
}
