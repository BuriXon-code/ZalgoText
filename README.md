# ZalgoText  

## About  
**ZalgoText** is a Bash script that generates **Zalgo text** by adding diacritical marks to characters. Zalgo text is a type of distorted, glitched text commonly used in horror and meme culture. This script allows you to control the intensity and color of the effect.  

![screenshot](/img1.jpg)  

## Installation  
1. **Download the script**  
   ```bash
   git clone https://github.com/BuriXon-code/ZalgoText
   cd ZalgoText
   ```  
2. **Grant execution permissions**  
   ```bash
   chmod +x zalgo.sh
   ```  
3. **Run the script**  
   ```bash
   ./zalgo.sh Your text here
   ```  

## Usage  
### Syntax  
```bash
./zalgo.sh [-c <ANSI 256color|crazy>] [-l <0-100>] [-n] <text>
```  

### Parameters  
- `-c <0-255|crazy>` → Sets text color using ANSI 256-color codes. Use `"crazy"` for random colors.  
- `-l <0-100>` → Controls the intensity (default: `10`). Higher values add more distortion.  
- `-n` → Disables automatic newlines.  
- `<text>` → The text to be transformed into Zalgo text.  

![screenshot](/img1.jpg)  

### Examples  
#### Default usage  
```bash
./zalgo.sh "Hello, World!"
```  
#### High intensity (50)  
```bash
./zalgo.sh -l 50 "Fear me!"
```  
#### Colored text (red - ANSI code 196)  
```bash
./zalgo.sh -c 196 "Red text"
```  
#### Random colors  
```bash
./zalgo.sh -c crazy "Insanity!"
```  
#### No newlines  
```bash
./zalgo.sh -n "Inline Zalgo"
```

![screenshot](/img1.jpg)  


> [!NOTE]
> **All parameters MUST be placed before the text!** Otherwise, the script will not interpret them correctly.  

> [!WARNING]
> Generating **extremely high levels of distortion (e.g., -l 100)** can cause **performance issues** or even **freeze the terminal**.

## Support
### Contact me:
For any issues, suggestions, or questions, reach out via:

- **Email:** support@burixon.com.pl  
- **Contact form:** [Click here](https://burixon.com.pl/kontakt.php)

### Support me:
If you find this script useful, consider supporting my work by making a donation:

[**DONATE HERE**](https://burixon.com.pl/donate/)

Your contributions help in developing new projects and improving existing tools!
