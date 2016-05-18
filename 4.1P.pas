program NameTester;
uses TerminalUserInput;

type
  HitDifficulty = (Normal, Hard, Insane); //enumeration

  TargetData = record
    name: string;
    hitID: integer;
    difficulty: HitDifficulty;
    value: integer;
  end;

function ReadDifficulty(prompt: string): HitDifficulty;
var
  val: integer;
begin
  WriteLn('Hit Difficulty Levels');
  WriteLn('1 - Normal');
  WriteLn('2 - Hard');
  WriteLn('3 - Insane');
  val := ReadInteger(prompt);

  while ((val < 1) or (val > 3)) do
  begin
    WriteLn('Please enter a value between 1 & 3.');
    val := ReadInteger(prompt);
  end;

  case val of
    1 : result := Normal;
    2 : result := Hard;
    3 : result := Insane;
  end;
end;

function ReadTargetData(prompt: string; var target: TargetData): TargetData;
begin
  WriteLn(prompt);
  target.name := ReadString('Enter Target Name: ');
  target.hitID := ReadInteger('Enter Hit Number: ');
  target.difficulty := ReadDifficulty('Enter the hit difficulty: ');
  target.value := ReadInteger('Enter Value: ');
  While target.value < 0 do
    begin
      WriteLn('Please enter a number greater than 0:');
      target.value := ReadInteger('Enter Value: ');
    end;
  result := target;
end;

procedure PrintTarget(toPrint: TargetData);
begin
  WriteLn('');
  WriteLn('Target Details: ');
  WriteLn('----------------');
  WriteLn('- Target Name: ', toPrint.name);
  WriteLn('- Hit ID Number: ', toPrint.hitID);
  WriteLn('- Difficulty: ', toPrint.difficulty);
  WriteLn('- Value: $', toPrint.value);

  if (toPrint.value < 10000) then
    WriteLn('- Low Priority')
  else if (toPrint.value > 10000) and (toPrint.value < 1000000) then
    WriteLn('- Normal Priority')
  else if (toPrint.value > 1000000) then
    WriteLn('- High Priority')
end;

procedure Main();
var
  target: TargetData;
begin
  target := ReadTargetData('Enter the details of the target', target);

  PrintTarget(target);
end;

begin
  Main();
end.
