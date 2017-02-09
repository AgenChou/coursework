#include <stdio.h>
#include <stdlib.h>

// Struct for nodes
struct element {
	struct element* next;
	int data;
};

// struct for the list
struct linked_list {
	struct element* head;
};

// Returns the length of the list (max. is 6)
int length(struct linked_list * list) {
	int counter = 0;
	if (list->head != NULL) {
		struct element * elem = list->head;
		counter++;
		while (elem->next != NULL) {
			counter++;
			elem = elem->next;
		}
	}
	return counter;
}

// Remove the head of the list
void remove_head(struct linked_list * list) {
	struct element* elem = list->head;
	list->head = elem->next;
	// to avoid memory leaks, free the memory from the old head
	free(elem);
}

// add an element to the list
void append_int(struct linked_list * list, int val) {
	struct element * elem = malloc(sizeof(struct element));
	elem->data = val;
	elem->next = NULL;
	if (list->head == NULL) {
		list->head = elem;
	} else {
		// if list has 6 elements, we need to drop head, before adding
		// a new element
		if(length(list) == 6) {
			remove_head(list);
		}
		struct element * tail = list->head;
		while (tail->next != NULL) {
			tail = tail->next; // move to the end of the list
		}
		tail->next = elem;
	}
};


void main(int argc, char *argv[]) {
	struct linked_list *list;
	for(int k = 0; k < 11; k++) {
		append_int(list, k);
		struct element* elem = list->head;
		do {
			printf("%d ->", elem->data);
		} while (elem->next != NULL);
		printf("\n");
	}
}




