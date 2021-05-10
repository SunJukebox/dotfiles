print("Hello, world!  I'm a .latexmkrc\n");
print("latexmkrc has been updated.\n");

$pdf_previewer = 'start okular';

# As suggested by Asymptote documentation.

sub asy {return system("asymptote -o asy/ '$_[0]'");}
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");