#include <stdio.h>

void readArray(int cout, int *my_array) {
  for (int i = 0; i < cout; ++i) {
    scanf("%d", (my_array + i));
  }
};

void readArrayFile(int size, int *my_array, FILE *s) {
  for (int i = 0; i < size; ++i) {
    fscanf(s, "%d", (my_array + i));
  }
};

int findMin(int size_array, int *array, int *amountMin) {
  *amountMin = 1;
  int valueMin = *array;
  for (int i = 1; i < size_array; ++i) {
    if (array[i] < valueMin) {
      valueMin = array[i];
      *amountMin = 1;
    } else {
      if (array[i] == valueMin) {
        ++*amountMin;
      }
    }
  }
  return valueMin;
}

void generateArray(int *array, int *new_array, int size_array, int min_value) {
  int i = 0;
  for (int j = 0; j < size_array; ++j) {
    if (array[j] != min_value) {
      new_array[i] = array[j];
      ++i;
    }
  }
};

void writeArray(int *new_array, int size_array) {
  for (int i = 0; i < size_array; ++i) {
    printf("%d ", new_array[i]);
  }
}

void writeArrayFile(int *new_array, int size_array, FILE *s) {
  for (int i = 0; i < size_array; ++i) {
    fprintf(s, "%d ", new_array[i]);
  }
}