
analyseChanges()
{
	staged_files_to_format=$(git diff --name-only --cached --diff-filter=ACMR | grep -E '\.(cpp|hpp|h)$')
	#untracked_files_to_format=$(git diff --name-only --diff-filter=ACMR | grep -E '\.(cpp|hpp)$')

	if [ -n "$staged_files_to_format" ]; then
		echo "Formatting code with clang-format..."
			echo "$staged_files_to_format" | xargs clang_format -i --style=file
			#echo "$untracked_files_to_format" | xargs clang_format -i --style=file
		echo "Code formatted successfully."
	else
		echo "No staged files to format. Skipping clang-format."
	fi
        #autopep8
}
formatChanges()
{
	staged_files_to_format=$(git diff --name-only --cached --diff-filter=ACMR | grep -E '\.(cpp|hpp|h)$')
	#untracked_files_to_format=$(git diff --name-only --diff-filter=ACMR | grep -E '\.(cpp|hpp)$')

	if [ -n "$staged_files_to_format" ]; then
		echo "Formatting code with clang-format..."
			echo "$staged_files_to_format" | xargs clang_format -i --style=file
			#echo "$untracked_files_to_format" | xargs clang_format -i --style=file
		echo "Code formatted successfully."
	else
		echo "No staged files to format. Skipping clang-format."
	fi
}
cleanCodeStaged()
{
	rm -rf CODE_ANALYSIS
	output_folder="CODE_ANALYSIS"
	mkdir -p "${output_folder}"
	analyseChanges
	formatChanges
}

cleanCode()
{
	hfts
	rm -rf CODE_ANALYSIS
	output_folder="CODE_ANALYSIS"
	mkdir "$output_folder"
	python Tools/cleanCode/cleanCode-CORE/cleanCode.py master origin
	analyseChanges
	formatChanges
}
cleanCodeProject()
{
	rm -rf CODE_ANALYSIS
	output_folder="CODE_ANALYSIS"
	mkdir "$output_folder"
        #cleanCode recursive
}

