# File Analyzer Script
The `file_analyzer.sh` script demonstrates several advanced Bash scripting concepts including recursive functions, redirection and error handling, here documents and here strings, special parameters, regular expressions, and command-line arguments using `getopts`

## Execution
1) Recursively search a directory for a keyword
```bash
./file_analyzer.sh -d logs -k error
```
2) Search for a keyword in a file
```bash
./file_analyzer.sh -f ~/eUR/config.txt -k port
```
3) Display the help menu
```bash
./file_analyzer.sh --help
```
4) Display the log file
```bash
cat errors.log
```
## Screenshot
1)
![image](https://github.com/user-attachments/assets/39b745f9-b7d6-4e65-9922-450eaac08865)


2)
![image](https://github.com/user-attachments/assets/7c2df3ee-7ce0-4ed8-9958-35a5b2047068)
