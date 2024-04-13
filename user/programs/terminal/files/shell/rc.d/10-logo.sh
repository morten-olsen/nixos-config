if [ `tput cols` -gt "70" ]; then
function PRINT_CENTER {
  COLS=`tput cols`
  OFFSET=$(( ($COLS - $1) / 2 ))
  PRE=""
  for i in `seq $OFFSET`; do
    PRE="$PRE "
  done 
  while IFS= read -r line; do
    echo "$PRE$line"
  done <<< "$2"
}
PRINT_CENTER 60 "

       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
       █░▄▄▀█▀▄▄▀█░▄▄░█▄░▄█▀▄▀██░▄░██░██░█░▄▄█░▄▄░█
       █░▀▀▄█░██░█░▀▄░██░██░█▀█░▀▀░▀█░██░█▄▄▀███▄██
       █▄█▄▄██▄▄██░▀▀░██▄███▄█████░███▄▄▄█▄▄▄█░▀▀░█
       ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
             
               ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          
                ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       
                      ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     
                       ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    
                      ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   
               ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  
              ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   
             ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  
             ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ 
                  ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     
                   ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     
▄▄▄ . ▌ ▐·▪  ▄▄▌    ▄▄▌ ▐ ▄▌▪  ▄▄▄▄▄ ▄ .▄      ▄• ▄▌▄▄▄▄▄
▀▄.▀·▪█·█▌██ ██•    ██· █▌▐███ •██  ██▪▐█ ▄█▀▄ █▪██▌•██  
▐▀▀▪▄▐█▐█•▐█·██ ▪   ██▪▐█▐▐▌▐█· ▐█.▪██▀▀█▐█▌.▐▌█▌▐█▌ ▐█.▪
▐█▄▄▌ ███ ▐█▌▐█▌ ▄  ▐█▌██▐█▌▐█▌ ▐█▌·██▌▐▀▐█▌.▐▌▐█▄█▌ ▐█▌·
 ▀▀▀ . ▀  ▀▀▀.▀▀▀    ▀▀▀▀ ▀▪▀▀▀ ▀▀▀ ▀▀▀ · ▀█▄▀▪ ▀▀▀  ▀▀▀ 

  > welcome x_x
"
fi