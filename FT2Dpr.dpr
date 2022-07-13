program FT2Dpr;

uses
  Forms,
  FT2D in 'FT2D.pas' {Form1},
  FT2D_Set in 'FT2D_Set.pas' {Form2},
  FT2D_Dat in 'FT2D_Dat.pas',
  FT2D_Sav in 'FT2D_Sav.pas' {Form4},
  FT2D_Inp in 'FT2D_Inp.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
