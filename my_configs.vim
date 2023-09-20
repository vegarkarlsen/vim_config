" Theme
let g:onedark_hide_endofbuffer = 1
let g:lightline = {
            \ 'colorscheme': 'onedark' }

let g:airline_theme='onedark'
" TODO add check for terminal support
" 24 bit color
"set termguicolors
" TODO same background color as terminal
colorscheme onedark

" Numbered lines
set number
set numberwidth=2

"always show corrections"
let g:ale_completion_enabled = 1

" TODO: fix cursor in insert mode and write mode

" jump to start/end of line
nmap H ^
nmap L $


function! GenerateSupport(username, mail)
  let text = "Får du logget inn på medlem.samfundet.no med kortnummer/epost\<CR>"
        \ . "(" . a:mail . ") og passordet ditt?\<CR>"
        \ . "Det er samme passord her som på eks. wiki.samfundet.no.\<CR>"
        \ . "Hvis du har glemt/mistet passordet ditt, kan du få nytt her:\<CR>"
        \ . "https://medlem.samfundet.no/account/lostpwd\<CR>"
        \ . "\<CR>"
        \ . "De vanligste feilene på tjenester som wiki.samfundet.no er:\<CR>"
        \ . "- Feil brukernavn: ditt brukernavn er " . a:username . " (og ikke " . a:username . "@samfundet.no)\<CR>"
        \ . "- Feil passord: vær helt sikker på at du skriver inn riktig passord.\<CR>"
        \ . "Noen mobiler (eks iPhone) starter automatisk med stor bokstav.\<CR>"
        \ . "- På Windows er det en bug som gjør at man må skrive inn brukernavn og\<CR>"
        \ . "passord to ganger før det går gjennom. (Vi har forsøkt å fikse dette\<CR>"
        \ . "for innsida)\<CR>"
        \ . "\<CR>"
        \ . "Hvis du prøver å logge inn gjennom en google-tjeneste, skal du bruke\<CR>"
        \ . a:username . "@samfundet.no som innlogging.\<CR>"
        \ . "\<CR>"
        \ . "Legger ved noen veiledninger:\<CR>"
        \ . "https://itk.samfundet.no/dok/Samfundet-bruker\<CR>"
        \ . "https://itk.samfundet.no/dok/Brukertjenester\<CR>"
        \ . "https://itk.samfundet.no/dok/gsuitebruker\<CR>"
        \ . "\<CR>"
        \ . "Ta kontakt igjen hvis du fortsatt har problemer.\<CR>"
execute "normal! i" . text . "\<Esc>"
endfunction
