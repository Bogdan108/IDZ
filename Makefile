.PHONY: testASM


ReadWriteFile: main_with_parts/complete
	./main_with_parts/complete read InOutputFiles/input.txt write InOutputFiles/output.txt
	./main_with_parts/complete write InOutputFiles/output_sec.txt read InOutputFiles/input_sec.txt

testASM: main
	./test.sh main Tests/Test1.txt Tests/Test1_output.txt
	./test.sh main Tests/Test2.txt Tests/Test2_output.txt
	./test.sh main Tests/Test3.txt Tests/Test3_output.txt
	./test.sh main Tests/Test4.txt Tests/Test4_output.txt
	./test.sh main Tests/Test5.txt Tests/Test5_output.txt
	./test.sh main Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main Tests/Test7.txt Tests/Test7_output.txt
	./test.sh main Tests/Test8.txt Tests/Test8_output.txt
	./test.sh main Tests/Test9.txt Tests/Test9_output.txt
	./test.sh main Tests/Test10.txt Tests/Test10_output.txt
	./test.sh main Tests/Test11.txt Tests/Test11_output.txt
	./test.sh main Tests/Test12.txt Tests/Test12_output.txt

testC: main_without_optimize/main_without_Optimize
	./test.sh main_without_optimize/main_without_Optimize Tests/Test1.txt Tests/Test1_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test2.txt Tests/Test2_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test3.txt Tests/Test3_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test4.txt Tests/Test4_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test5.txt Tests/Test5_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test7.txt Tests/Test7_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test8.txt Tests/Test8_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test9.txt Tests/Test9_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test10.txt Tests/Test10_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test11.txt Tests/Test11_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test12.txt Tests/Test12_output.txt

testASMRegisters: main_with_Registers
	./test.sh main_with_Registers Tests/Test1.txt Tests/Test1_output.txt
	./test.sh main_with_Registers Tests/Test2.txt Tests/Test2_output.txt
	./test.sh main_with_Registers Tests/Test3.txt Tests/Test3_output.txt
	./test.sh main_with_Registers Tests/Test4.txt Tests/Test4_output.txt
	./test.sh main_with_Registers Tests/Test5.txt Tests/Test5_output.txt
	./test.sh main_with_Registers Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main_with_Registers Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main_with_Registers Tests/Test7.txt Tests/Test7_output.txt
	./test.sh main_with_Registers Tests/Test8.txt Tests/Test8_output.txt
	./test.sh main_with_Registers Tests/Test9.txt Tests/Test9_output.txt
	./test.sh main_with_Registers Tests/Test10.txt Tests/Test10_output.txt
	./test.sh main_with_Registers Tests/Test11.txt Tests/Test11_output.txt
	./test.sh main_with_Registers Tests/Test12.txt Tests/Test12_output.txt
