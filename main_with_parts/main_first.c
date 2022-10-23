#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

extern void readArray(int cout, int *my_array);
extern void readArrayFile(int size, int *my_array, FILE *s);
extern int findMin(int size_array, int *array, int *amountMin);
extern void generateArray(int *array, int *new_array, int size_array, int min_value);
extern void generateArray(int *array, int *new_array, int size_array, int min_value);
extern void writeArray(int *new_array, int size_array);
extern void writeArrayFile(int *new_array, int size_array, FILE *s);

int main(int argc, char *argv[]) {
  int amount = 1;
  int size_array;
  int valueMin, minValueAmount = 0;
  FILE *input_file;
  FILE *output_file;
  if (argc > 1) {
    if ((strcmp(argv[1], "read") == 0)) {
      input_file = fopen(argv[2], "r");
      output_file = fopen(argv[4], "w");
    } else {
      output_file = fopen(argv[2], "w");
      input_file = fopen(argv[4], "r");
    }
    --amount;
  }

  if (amount) {
    scanf("%d", &size_array);
  } else {
    fscanf(input_file, "%d", &size_array);
  }

  if (size_array < 1) {
    printf("Not enough arguments!");
    return 0;
  }

  // динамически выделяем массив
  int *array = malloc(4 * size_array);

  // считывание массива;
  if (amount) {
    readArray(size_array, array);
  } else {
    readArrayFile(size_array, array, input_file);
    fclose(input_file);
  }

  valueMin = findMin(size_array, array, &minValueAmount);

  // динамически выделяем новый массив
  int *new_array = malloc(4 * (size_array - minValueAmount));

  // вызываю функцию для формирования нвого массива
  generateArray(array, new_array, size_array, valueMin);
  // вывод массива
  if (amount) {
    writeArray(new_array, (size_array - minValueAmount));
  } else {
    writeArrayFile(new_array, (size_array - minValueAmount), output_file);
    fclose(output_file);
  }
  // освобождаем память
  free(new_array);
  free(array);
  return 0;
};