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
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    noiseSizeMessure: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button2: TButton;
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
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    Timer1: TTimer;

    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label14Click(Sender: TObject);
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
  LastValidSeeda1Input: string;
  Seeda1Input: Integer;
  LastValidSeedb1Input: string;
  Seedb1Input: Integer;
  LastValidSeedc1Input: string;
  Seedc1Input: Integer;
  LastValidSeedd1Input: string;
  Seedd1Input: Integer;
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
     LastValidSeeda1Input := Edit2.Text;
     Seeda1Input := StrToInt(Edit2.Text);
     LastValidSeedb1Input := Edit3.Text;
     Seedb1Input := StrToInt(Edit3.Text);
     LastValidSeedc1Input := Edit4.Text;
     Seedc1Input := StrToInt(Edit4.Text);
     LastValidSeedd1Input := Edit5.Text;
     Seedd1Input := StrToInt(Edit5.Text);
     StaticText1.caption := 'Zeitquantisirte Erfassung einer zugrundeliegenden physikalischen Zufallsgröße. (Hier Simuliert!)' + #10 + #10 + '+ optimale statistische Eigenschaften' + #10 + '+ ohne Speicher keine Reproduzierbarkeit' + #10 + #10 + '- Eigenschaften sind von der physikalischen Quelle abhängig';
     StaticText2.caption := 'Zählt ab Start und wird durch zufälliges zählerunabhängiges Stoppereignis vom Zählerwert zur Zufallszahl' + #10 + #10 + '+ optimale statistische Eigenschaften' + #10 + '+ohne Speicher keine Reproduzierbarkeit' + #10 + #10 + '- Organisation der Stoppereignisse' + #10 + '- Stoppereignisse nicht zeitlich äquidistant' + #10 + '- mehrfach vollständiges Durchzählen zwischen aufeinanderfolgenden Stoppereignissen sicherzustellen';
     StaticText3.caption := 'Tabellenwerk (Buch) von Zufallszahlen, enthält 1M Zufallszahlen' + #10 + #10 + '+ optimale statistische Eigenschaften' + #10 + '+ reproduzierbarkeit / irreproduzierbarkeit, leicht vom Anwender steuerbar' + #10 + #10 + '- endlicher Vorrat an Zufallszahlen' + #10 + '- Übertragung vom Buch zum Computer' + #10 + '- Bekanntheit des Buches';
     StaticText4.caption := 'Pi: 314 79 98 264 643 87 502 318 950 482' + #10 + 'e: 271 135 405 938 267 783 217 651 104 543' + #10 + #10 + 'Sind aus PI und e generierte Zahlen die nicht als Nullstellen beliebiger Polynome a_nx^x+a_n-1x^n-1+...+a_1x+a_0 mit a_i element von Rationalen Zahlen vorkommen können.' + #10 + #10 + 'Berechnung und Tabellierung der gewünschten transzendenten Zahl auf hinreichend viele zuverlässige Nachkommastellen' + #10 + 'zufällige Auswahl einer Ziffernfolge, Nutzung als Zufallszahlenfolge und Kennzeichnung als bereits genutzt' + #10 + #10 + '+ leichte rechnergestützte Realisirbarkeit' + #10 + '+ leichte Vorgaben für spätere Nutzung' + #10 + #10 + '- keine gesicherten statistischen Eigenschaften, nur Annahmen' + #10 + '- hoher Bekanntheitsgrad der Ziffernfolgen';
     StaticText5.caption := '+ leichte Implementierbarkeit' + #10 + '+ schnelligkeit des Verfahrens' + #10 + #10 + '- keine optimalen statistischen Eigenschaften' + #10 + '- kleine Periodenlänge' + #10 + '- leichte Vorhersagbarkeit der PZZ-Folge';
     StaticText6.caption := 'Verfahren nach Blum, Shub' + #10 + #10 + '+ perfekter Pseudozufallszahlengenerator' + #10 + '+ leichte implementierbarkeit' + #10 + '+ leichte Wahl geeigneter Parameterbelegungen' + #10 + #10 + '- nur ein Bit pro Rekursionsschritt -> langsam' + #10 + '- kleine Periodenlänge';
     StaticText7.caption := 'maximale Periodenlänge m^r-1 Belegungsvorschrift der Parameter für max, Periodenlänge ändert sich mit jedem Vorgabewert für r keine geschlossene Darstellung.' + #10 + #10 + '+ größere maximale Periodenlänge' + #10 + '+schwierige Vorhersagbarkeit' + #10 + '+ Schnelligkeit des Verfahrens' + #10 + '+ leichte Implementierbarkeit' + #10 + #10 + '- keine optimalen statistischen Eigenschaften, nicht perfekt' + #10 + '- hoher Aufwand zum Finden geeigneter Parameterbelegungen';
     StaticText8.Caption :=
       'Das Schieberegister wird mit einer Bitfolge initialisiert.' + #10 +
       'Jede Zelle speichert ein Bit für einen Takt.' + #10 +
       'Bits schieben sich taktweise durch die Kaskade.' + #10 +
       'Das Bit der letzten Zelle wird als Pseudozufallsbit taktweise ausgegeben.' + #10 +
       'Das Bit der ersten Zelle wird mittels einer Rückkopplungsfunktion berechnet.' + #10 +
       'Die Rückkopplungsfunktion und ihre Parameter bestimmen wesentlich ' + #10 +
       'die Qualität der statistischen Eigenschaften der Pseudozufallszahl-Folge.' + #10 +
       '' + #10 +
       '+ Größere maximale Periodenlänge.' + #10 +
       '+ Schwierige Vorhersagbarkeit.' + #10 +
       '+ Schnelligkeit des Verfahrens.' + #10 +
       '+ Leichte Implementierbarkeit.' + #10 +
       '' + #10 +
       '- Keine optimalen statistischen Eigenschaften.' + #10 +
       '- Hoher Aufwand zum Finden geeigneter Parameterbelegungen.';
end;

procedure TMainWindow.Label14Click(Sender: TObject);
begin

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

procedure TMainWindow.Edit2Change(Sender: TObject);
var
  InputText: string;
begin
  // Den aktuellen Inhalt des Eingabefeldes abrufen
  InputText := Edit2.Text;

  // Versuchen, den aktuellen Inhalt in eine Zahl umzuwandeln
  if TryStrToInt(InputText, Seeda1Input) then
  begin
    // Wenn die Umwandlung erfolgreich ist, aktualisieren Sie den letzten gültigen Inhalt
    LastValidSeeda1Input := InputText;
  end
  else
  begin
    // Wenn die Umwandlung fehlschlägt, zeigen Sie eine Fehlermeldung an
    ShowMessage('Ungültige Eingabe: Bitte geben Sie eine ganze Zahl ein.');
    // Setzen Sie den Inhalt des Eingabefeldes auf den letzten gültigen Inhalt zurück
    Edit2.Text := LastValidSeeda1Input;
    // Bewegen Sie den Cursor an das Ende des Eingabefeldes
    Edit2.SelStart := Length(Edit2.Text);
  end;
end;

procedure TMainWindow.Edit3Change(Sender: TObject);
var
  InputText: string;
begin
  // Den aktuellen Inhalt des Eingabefeldes abrufen
  InputText := Edit3.Text;

  // Versuchen, den aktuellen Inhalt in eine Zahl umzuwandeln
  if TryStrToInt(InputText, Seedb1Input) then
  begin
    // Wenn die Umwandlung erfolgreich ist, aktualisieren Sie den letzten gültigen Inhalt
    LastValidSeedb1Input := InputText;
  end
  else
  begin
    // Wenn die Umwandlung fehlschlägt, zeigen Sie eine Fehlermeldung an
    ShowMessage('Ungültige Eingabe: Bitte geben Sie eine ganze Zahl ein.');
    // Setzen Sie den Inhalt des Eingabefeldes auf den letzten gültigen Inhalt zurück
    Edit3.Text := LastValidSeedb1Input;
    // Bewegen Sie den Cursor an das Ende des Eingabefeldes
    Edit3.SelStart := Length(Edit3.Text);
  end;
end;

procedure TMainWindow.Edit4Change(Sender: TObject);
var
  InputText: string;
begin
  // Den aktuellen Inhalt des Eingabefeldes abrufen
  InputText := Edit4.Text;

  // Versuchen, den aktuellen Inhalt in eine Zahl umzuwandeln
  if TryStrToInt(InputText, Seedc1Input) then
  begin
    // Wenn die Umwandlung erfolgreich ist, aktualisieren Sie den letzten gültigen Inhalt
    LastValidSeedc1Input := InputText;
  end
  else
  begin
    // Wenn die Umwandlung fehlschlägt, zeigen Sie eine Fehlermeldung an
    ShowMessage('Ungültige Eingabe: Bitte geben Sie eine ganze Zahl ein.');
    // Setzen Sie den Inhalt des Eingabefeldes auf den letzten gültigen Inhalt zurück
    Edit4.Text := LastValidSeedc1Input;
    // Bewegen Sie den Cursor an das Ende des Eingabefeldes
    Edit4.SelStart := Length(Edit4.Text);
  end;
end;

procedure TMainWindow.Edit5Change(Sender: TObject);
var
  InputText: string;
begin
  // Den aktuellen Inhalt des Eingabefeldes abrufen
  InputText := Edit5.Text;

  // Versuchen, den aktuellen Inhalt in eine Zahl umzuwandeln
  if TryStrToInt(InputText, Seedd1Input) then
  begin
    // Wenn die Umwandlung erfolgreich ist, aktualisieren Sie den letzten gültigen Inhalt
    LastValidSeedd1Input := InputText;
  end
  else
  begin
    // Wenn die Umwandlung fehlschlägt, zeigen Sie eine Fehlermeldung an
    ShowMessage('Ungültige Eingabe: Bitte geben Sie eine ganze Zahl ein.');
    // Setzen Sie den Inhalt des Eingabefeldes auf den letzten gültigen Inhalt zurück
    Edit5.Text := LastValidSeedd1Input;
    // Bewegen Sie den Cursor an das Ende des Eingabefeldes
    Edit5.SelStart := Length(Edit5.Text);
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
  if StopereignisElapsedTime = 100 then
  begin
       StopereignisElapsedTime := 0;
  end;
  Label12.Caption := Format('%d Millisekunden', [StopereignisElapsedTime]);
end;


function GenerateRandomNumbera(seed1, seed2, a1, a2, c, m: Int64): Int64;
begin
  // Berechnung der nächsten Zufallszahl
  seed1 := (a1 * seed1 + c) mod m;
  seed2 := (a2 * seed2 + c) mod m;
  Result := (seed1 + seed2) mod m;
end;

procedure TMainWindow.Button8Click(Sender: TObject);
var
  seed1, seed2, a1, a2, c, m: Int64;
  randomNum: Int64;
begin
  // Initialisierungsparameter
  seed1 := Seeda1Input; // Anfangswert für den ersten Generator
  seed2 := Seedb1Input; // Anfangswert für den zweiten Generator
  a1 := 6364136223846793005; // Multiplikationskonstante für den ersten Generator (große Primzahl)
  a2 := 1442695040888963407; // Multiplikationskonstante für den zweiten Generator (große Primzahl)
  c := 1442695040888963407; // Additionskonstante (eine weitere große Primzahl)
  m := 9223372036854775783; // Modul (eine große Primzahl)

  // Generiere eine Zufallszahl
  randomNum := GenerateRandomNumbera(seed1, seed2, a1, a2, c, m);

  // Gib die generierte Zufallszahl aus
  ShowMessage('Random Number: ' + inttostr(randomNum));
end;

function GenerateRandomNumberb(seed, a, m: Int64): Int64;
begin
  // Berechnung der nächsten Zufallszahl
  seed := (a * seed) mod m;
  Result := seed;
end;

procedure TMainWindow.Button9Click(Sender: TObject);
var
  seed, a, m: Int64;
  randomNum: Int64;
begin
  // Initialisierungsparameter
  seed := Seedc1Input; // Anfangswert für den Generator
  a := 6364136223846793005; // Multiplikationskonstante (große Primzahl)
  m := 9223372036854775783; // Modul (eine große Primzahl)

  // Generiere eine Zufallszahl
  randomNum := GenerateRandomNumberb(seed, a, m);

  // Gib die generierte Zufallszahl aus
  ShowMessage('Random Number: ' + inttostr(randomNum));
end;

function GenerateRandomNumberc(var seed: Int64; n: Int64): Int64;
begin
  // Berechnung der nächsten Zufallszahl
  seed := (seed * seed) mod n;
  Result := seed;
end;

procedure TMainWindow.Button10Click(Sender: TObject);
var
  seed, n: Int64;
  randomNum: Int64;
begin
  // Parameter gemäß den Anforderungen
  seed := Seedd1Input; // Startwert
  n := 23; // Modul

  // Generiere eine Zufallszahl
  randomNum := GenerateRandomNumberc(seed, n);

  // Gib die generierte Zufallszahl aus
  ShowMessage('Random Number: ' + inttostr(randomNum));
end;

function GenerateRandomNumberd(var seeds: array of Int64; m, r: Integer): Int64;
var
  i: Integer;
begin
  // Rekursionsschritte durchführen
  for i := 0 to r - 1 do
    seeds[i] := (seeds[i] * seeds[(i + 1) mod r]) mod m;

  // Ergebnis zurückgeben (zum Beispiel das letzte Element)
  Result := seeds[r - 1];
end;

procedure TMainWindow.Button11Click(Sender: TObject);
var
  seeds: array[0..2] of Int64; // Beispiel: 3 Rekursionsschritte
  m, r: Integer;
  randomNum: Int64;
begin
  // Parameter gemäß den Anforderungen
  seeds[0] := 5; // Startwert für den ersten Rekursionsschritt
  seeds[1] := 7; // Startwert für den zweiten Rekursionsschritt
  seeds[2] := 11; // Startwert für den dritten Rekursionsschritt
  m := 23; // Modul
  r := 3; // Anzahl der Rekursionsschritte

  // Generiere eine Zufallszahl
  randomNum := GenerateRandomNumberd(seeds, m, r);
  ShowMessage('Random Number: ' + inttostr(randomNum));
end;


function BinaryToDecimal(binary: array of Boolean): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := High(binary) downto 0 do
    if binary[i] then
      Result := Result + (1 shl (High(binary) - i));
end;

function BoolArrayToString(arr: array of Boolean): string;
var
  i: Integer;
begin
  Result := '';
  for i := Low(arr) to High(arr) do
  begin
    if arr[i] then
      Result := Result + '1'
    else
      Result := Result + '0';
  end;
end;



function LFSRStep(var register: array of Boolean; taps: array of Integer): Boolean;
var
  i: Integer;
  feedbackBit: Boolean;
begin
  // Berechne das Feedback-Bit basierend auf den angegebenen Kippstellen
  feedbackBit := register[taps[0]];
  for i := 1 to High(taps) do
    feedbackBit := feedbackBit xor register[taps[i]];

  // Verschiebe das Register um ein Bit nach rechts
  for i := High(register) downto 1 do
    register[i] := register[i - 1];

  // Setze das neue Bit an der Position 0 basierend auf dem Feedback-Bit
  register[0] := feedbackBit;

  // Debugging-Ausgabe
  //ShowMessage('FeedbackBit: ' + BoolToStr(feedbackBit) + sLineBreak + 'Register after shift: ' + BoolArrayToString(register));

  // Gib das ausgegebene Bit zurück (das aus dem Schieberegister herausgeschobene Bit)
  Result := register[High(register)];
end;


procedure TMainWindow.Button12Click(Sender: TObject);
var
  register: array[0..7] of Boolean; // Beispiel: 8-Bit-Schieberegister
  taps: array[0..2] of Integer = (3, 4, 5); // Beispiel: Kippstellen
  outputBit: Boolean;
  i: Integer; // Variable für Schleifeniteration
  binaryOutput: string; // String für die binäre Ausgabe
  decimalOutput: string; // String für die dezimale Ausgabe
begin
  // Initialisierung des Registers mit zufälligen Werten
  Randomize; // Zufallszahlengenerator initialisieren
  for i := Low(register) to High(register) do
    register[i] := Random(2) = 1; // Zufällig 0 oder 1 auswählen


  // Schrittweise Ausführung des LFSR
  for i := 1 to 10 do
  begin
    outputBit := LFSRStep(register, taps);

    // Debugging-Ausgabe
    ShowMessage('Iteration: ' + IntToStr(i) + sLineBreak +
                'Register: ' + BoolArrayToString(register) + sLineBreak +
                'OutputBit: ' + BoolToStr(outputBit));

    binaryOutput := binaryOutput + BoolToStr(outputBit);
    decimalOutput := decimalOutput + IntToStr(Ord(outputBit));

    // Füge ein Leerzeichen hinzu, um die Ausgabe zu trennen
    if i < 10 then
    begin
      binaryOutput := binaryOutput + ' ';
      decimalOutput := decimalOutput + ' ';
    end;
  end;

  // Ausgabe der Ergebnisse
  ShowMessage('Binary Output: ' + binaryOutput + sLineBreak + 'Decimal Output: ' + decimalOutput);
end;

end.

