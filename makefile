make: 
	ls -laR ~/ > files

runSummary: filesummary.awk files
	gawk -f filesummary.awk files	 

runPassword: pwfile.awk
	gawk -f pwfile.awk /etc/passwd

runAverage: average.awk spreadsheet
	gawk -f average.awk spreadsheet
	cat average.out

runAll: filesummary.awk files pwfile.awk average.awk spreadsheet
	gawk -f filesummary.awk files	 
	gawk -f pwfile.awk /etc/passwd
	gawk -f average.awk spreadsheet
	cat average.out
clean:
	rm -r files
	rm -r average.out
