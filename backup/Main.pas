unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,

  PerlinNoiseGen;


type

  { TMainWindow }

  TMainWindow = class(TForm)
    Edit1: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    noiseSizeMessure: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    ButtonTest: TButton;
    Button2: TButton;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    Timer1: TTimer;

    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure noiseSizeMessureClick(Sender: TObject);
    procedure ButtonTestClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  MainWindow: TMainWindow;

implementation

{$R *.lfm}

{ TMainWindow }

var
  LastValidSeedR1Input: string;
  SeedR1Input: Integer;
  StopereignisElapsedTime: Integer;


procedure TMainWindow.ButtonTestClick(Sender: TObject);
begin

end;


procedure TMainWindow.noiseSizeMessureClick(Sender: TObject);
const
  SampleCount = 100; // Anzahl der Proben für die Messung
var
  PerlinNoiseValues: array[0..SampleCount - 1] of Double;
  Mean, StdDev: Double;
  i: Integer;
begin
  TPerlinNoise.Init(SeedR1Input); // Initialisierung des Perlin-Noise-Generators mit einem Seed

  // Generieren von Perlin-Noise-Werten und Speichern in einem Array
  for i := 0 to SampleCount - 1 do
    PerlinNoiseValues[i] := TPerlinNoise.Noise(i / SampleCount, i / SampleCount, i / SampleCount);

  // Berechnung des Mittelwerts
  Mean := 0;
  for i := 0 to SampleCount - 1 do
    Mean := Mean + PerlinNoiseValues[i];
  Mean := Mean / SampleCount;

  // Berechnung der Standardabweichung
  StdDev := 0;
  for i := 0 to SampleCount - 1 do
    StdDev := StdDev + Sqr(PerlinNoiseValues[i] - Mean);
  StdDev := Sqrt(StdDev / SampleCount);

  // Anzeigen der Messergebnisse
  ShowMessage('Mean: ' + FloatToStr(Mean) + sLineBreak +
              'Standard Deviation: ' + FloatToStr(StdDev));

end;

procedure TMainWindow.Label8Click(Sender: TObject);
begin

end;

procedure TMainWindow.Label9Click(Sender: TObject);
begin

end;

procedure TMainWindow.FormCreate(Sender: TObject);
begin
     LastValidSeedR1Input := Edit1.Text;
     SeedR1Input := StrToInt(Edit1.Text);
     StaticText1.caption := 'Zeitquantisirte Erfassung einer zugrundeliegenden physikalischen Zufallsgröße. (Hier Simuliert!)' + #10 + #10 + '+ optimale statistische Eigenschaften' + #10 + '+ ohne Speicher keine Reproduzierbarkeit' + #10 + #10 + '- Eigenschaften sind von der physikalischen Quelle abhängig';
     StaticText2.caption := 'Zählt ab Start und wird durch zufälliges zählerunabhängiges Stoppereignis vom Zählerwert zur Zufallszahl' + #10 + #10 + '+ optimale statistische Eigenschaften' + #10 + '+ohne Speicher keine Reproduzierbarkeit' + #10 + #10 + '- Organisation der Stoppereignisse' + #10 + '- Stoppereignisse nicht zeitlich äquidistant' + #10 + '- mehrfach vollständiges Durchzählen zwischen aufeinanderfolgenden Stoppereignissen sicherzustellen';
     StaticText3.caption := 'Tabellenwerk (Buch) von Zufallszahlen, enthält 1M Zufallszahlen' + #10 + #10 + '+ optimale statistische Eigenschaften' + #10 + '+ reproduzierbarkeit / irreproduzierbarkeit, leicht vom Anwender steuerbar' + #10 + #10 + '- endlicher Vorrat an Zufallszahlen' + #10 + '- Übertragung vom Buch zum Computer' + #10 + '- Bekanntheit des Buches';
     StaticText4.caption := 'Pi: 314 79 98 264 643 87 502 318 950 482' + #10 + 'e: 271 135 405 938 267 783 217 651 104 543' + #10 + #10 + 'Sind aus PI und e generierte Zahlen die nicht als Nullstellen beliebiger Polynome a_nx^x+a_n-1x^n-1+...+a_1x+a_0 mit a_i element von Rationalen Zahlen vorkommen können.' + #10 + #10 + 'Berechnung und Tabellierung der gewünschten transzendenten Zahl auf hinreichend viele zuverlässige Nachkommastellen' + #10 + 'zufällige Auswahl einer Ziffernfolge, Nutzung als Zufallszahlenfolge und Kennzeichnung als bereits genutzt' + #10 + #10 + '+ leichte rechnergestützte Realisirbarkeit' + #10 + '+ leichte Vorgaben für spätere Nutzung' + #10 + #10 + '- keine gesicherten statistischen Eigenschaften, nur Annahmen' + #10 + '- hoher Bekanntheitsgrad der Ziffernfolgen';
end;


procedure TMainWindow.Edit1Change(Sender: TObject);
var
  InputText: string;
begin
  // Den aktuellen Inhalt des Eingabefeldes abrufen
  InputText := Edit1.Text;

  // Versuchen, den aktuellen Inhalt in eine Zahl umzuwandeln
  if TryStrToInt(InputText, SeedR1Input) then
  begin
    // Wenn die Umwandlung erfolgreich ist, aktualisieren Sie den letzten gültigen Inhalt
    LastValidSeedR1Input := InputText;
  end
  else
  begin
    // Wenn die Umwandlung fehlschlägt, zeigen Sie eine Fehlermeldung an
    ShowMessage('Ungültige Eingabe: Bitte geben Sie eine ganze Zahl ein.');
    // Setzen Sie den Inhalt des Eingabefeldes auf den letzten gültigen Inhalt zurück
    Edit1.Text := LastValidSeedR1Input;
    // Bewegen Sie den Cursor an das Ende des Eingabefeldes
    Edit1.SelStart := Length(Edit1.Text);
  end;
end;

procedure TMainWindow.Button2Click(Sender: TObject);
begin
  if Button2.Caption = 'Start' then
  begin
    Button2.Caption := 'Stop';
    StopereignisElapsedTime := 0;
    Timer1.Enabled := True;
  end
  else if Button2.Caption = 'Stop' then
  begin
    Button2.Caption := 'Start';
    Timer1.Enabled := False;
  end
end;

procedure TMainWindow.Button5Click(Sender: TObject);
begin

end;

procedure TMainWindow.Timer1Timer(Sender: TObject);
begin
  StopereignisElapsedTime := StopereignisElapsedTime + 1;
  if StopereignisElapsedTime = 250 then
  begin
       StopereignisElapsedTime := 0;
  end;
  Label12.Caption := Format('%d Millisekunden', [StopereignisElapsedTime]);
end;






end.

