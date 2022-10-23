#include <stdio.h>
#include <stdlib.h>

void readArray(int cout, int *my_array) {
    for (int i = 0; i < cout; ++i) {
        scanf("%d", (my_array + i));
    }
};

int findMin(int size_array, int*array, int*amountMin) {
     *amountMin = 1;
    int valueMin = *array;
    for(int i = 1; i < size_array; ++i){
        if(array[i] < valueMin){
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

int main() {
    int size_array;
    int valueMin, minValueAmount = 0;
    scanf("%d", &size_array);
    if (size_array < 1) {
        printf("Not enough arguments!");
        return 0;
    }
    // динамически выделяем массив
    int *array = malloc(4*size_array);
    // считывание массива;
    readArray(size_array, array);
    valueMin = findMin(size_array,array,&minValueAmount);
    // динамически выделяем новый массив
    int *new_array = malloc(4*(size_array - minValueAmount));

    // вызываю функцию для формирования нвого массива
    generateArray(array, new_array, size_array, valueMin);
    // вывод массива
    writeArray(new_array, (size_array - minValueAmount));

    // освобождаем память
    free(new_array);
    free(array);
    return 0;
};