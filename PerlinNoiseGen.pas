unit PerlinNoiseGen;

{$mode objfpc}{$H+}

interface

type
  TPerlinNoise = class
  private
    class var p: array[0..511] of Integer;
    class var permutation: array[0..255] of Integer;
    class var seedValue: Integer;
    class procedure GeneratePermutation; static;
    class function Fade(t: Double): Double; static; inline;
    class function Lerp(t, a, b: Double): Double; static; inline;
    class function Grad(hash: Integer; x, y, z: Double): Double; static; inline;
  public
    class procedure Init(Seed: Integer); static;
    class function Noise(PosX, PosY, PosZ: Double): Double; static;
  end;

implementation

uses
  Math;

class procedure TPerlinNoise.GeneratePermutation;
var
  i, j, temp: Integer;
begin
  // Initialisierung der Permutations-Tabelle mit Werten von 0 bis 255
  for i := 0 to 255 do
    permutation[i] := i;

  // Verwendung des Seeds, um die Permutations-Tabelle zu mischen
  for i := 0 to 255 do
  begin
    j := (seedValue + i) and 255;
    temp := permutation[i];
    permutation[i] := permutation[j];
    permutation[j] := temp;
  end;

  // Duplizieren des Permutations-Arrays für einfachen Zugriff
  for i := 0 to 255 do
  begin
    p[i] := permutation[i];
    p[i + 256] := permutation[i]; // Duplizieren von Werten für die zweite Hälfte
  end;
end;

class procedure TPerlinNoise.Init(Seed: Integer);
begin
  seedValue := Seed;
  GeneratePermutation;
end;

class function TPerlinNoise.Fade(t: Double): Double;
begin
  Result := t * t * t * (t * (t * 6 - 15) + 10);
end;

class function TPerlinNoise.Lerp(t, a, b: Double): Double;
begin
  Result := a + t * (b - a);
end;

class function TPerlinNoise.Grad(hash: Integer; x, y, z: Double): Double;
var
  h: Integer;
  u, v, w: Double;
begin
  h := hash and 15;
  case h of
    0, 1, 2, 3, 8, 9, 10, 11: u := x;
    4, 5, 6, 7, 12, 13, 14, 15: u := y;
  end;
  case h of
    0, 1, 4, 5, 8, 9, 12, 13: v := y;
    2, 3, 6, 7, 10, 11, 14, 15: v := z;
  end;
  case h of
    0, 2, 4, 6, 8, 10, 12, 14: w := z;
    1, 3, 5, 7, 9, 11, 13, 15: w := x;
  end;
  if h and 1 = 0 then
    u := -u;
  if h and 2 = 0 then
    v := -v;
  if h and 4 = 0 then
    w := -w;
  Result := u + v + w;
end;

class function TPerlinNoise.Noise(PosX, PosY, PosZ: Double): Double;
var
  X, Y, Z: LongInt;
  u, v, w: Double;
  A, AA, AB, B, BA, BB: LongInt;
begin
  X := Trunc(PosX) and $FF;
  Y := Trunc(PosY) and $FF;
  Z := Trunc(PosZ) and $FF;
  PosX := Frac(PosX);
  PosY := Frac(PosY);
  PosZ := Frac(PosZ);
  u := Fade(PosX);
  v := Fade(PosY);
  w := Fade(PosZ);
  A := p[X] + Y;
  AA := p[A] + Z;
  AB := p[A + 1] + Z;
  B := p[X + 1] + Y;
  BA := p[B] + Z;
  BB := p[B + 1] + Z;
  Result := (Lerp(w, Lerp(v, Lerp(u, Grad(p[AA], PosX, PosY, PosZ),
                                    Grad(p[BA], PosX - 1, PosY, PosZ)),
                          Lerp(u, Grad(p[AB], PosX, PosY - 1, PosZ),
                                    Grad(p[BB], PosX - 1, PosY - 1, PosZ))),
                    Lerp(v, Lerp(u, Grad(p[AA + 1], PosX, PosY, PosZ - 1),
                                    Grad(p[BA + 1], PosX - 1, PosY, PosZ - 1)),
                          Lerp(u, Grad(p[AB + 1], PosX, PosY - 1, PosZ - 1),
                                    Grad(p[BB + 1], PosX - 1, PosY - 1, PosZ - 1)))))
           * 2.0; // Skalierung der Ergebnisse auf den Bereich von 0 bis 1
end;


end.

