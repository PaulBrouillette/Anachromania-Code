// @desc Sorts the units on screen by their speed
// Even though it's bubble sort it's aight
function BubbleSort(list){
	var listSize = ds_list_size(list);
	for (var i = 0; i < listSize - 1; i++) {
		for (var j = 0; j < listSize - i - 1; j++) {
			if (list[|j].mySpeed < list[|j + 1].mySpeed) {
				var temp = list[|j];
				list[|j] = list[|j + 1];
				list[|j + 1] = temp;
			}
		}
	}
}