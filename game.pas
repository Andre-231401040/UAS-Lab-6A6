program gameDadu;
uses crt;
var
i, x : integer;
jmlhPemain, skorTarget ,banyakSeri: byte; 
skorPemain, selisihSkor : array of integer;
namaPemain, pemainSeri : array of string;
tie : boolean;
//function acak dadu
function lemparDadu:byte;
begin
    randomize;
    lemparDadu := random(5)+1;
end;
//prosedur bermain dan akumulasi skor
procedure bermain(jmlhPemain : byte);
var
i, angkaDadu : integer;
begin
    for i := 0 to jmlhPemain - 1 do
        begin
            writeln('Pemain ke-',i+1);
            angkaDadu := lemparDadu;
            skorPemain[i] += angkaDadu;
            writeln('Dadu anda bernilai ',angkaDadu);
            writeln('Skor anda saat ini: ',skorPemain[i]);
            readkey;
            writeln;
        end;
end;
//prosedur mencari selisih
procedure mencariSelisih(jmlhPemain : byte);

begin
    for i:= 0 to jmlhPemain -1 do
        begin
            if(skorPemain[i] <= skorTarget) then
                begin
                    selisihSkor[i] := skorTarget - skorPemain[i];
                end
            else
                begin
                    selisihSkor[i] := skorPemain[i] - skorTarget;
                end;
        end;
end;

//prosedur mengurutkan selisih dari yang terkecil sampai terbesar
//prosedur mengurutkan selisih dari yang terkecil sampai terbesar dan ranking pemain
procedure sort(jmlhPemain : byte);
var
j, temp : byte;
temp1,temp3 : byte;
temp2 : string;
begin
    for i := 0 to jmlhPemain - 2 do
        begin
            for j := i+1 to jmlhPemain - 1 do
                begin
                    if(selisihSkor[j] < selisihSkor[i]) then
                        begin
                            temp := selisihSkor[i];
                            temp1 := selisihSkor[i];
                            selisihSkor[i] := selisihSkor[j];
                            selisihSkor[j] := temp;
                            selisihSkor[j] := temp1;
                            temp2 := namaPemain[i];
                            namaPemain[i] := namaPemain[j];
                            namaPemain[j] := temp2;
                            temp3 := skorPemain[i];
                            skorPemain[i] := skorPemain[j];
                            skorPemain[j] := temp3;
                        end;
                end;
        end;
end;

//prosedur tampilkan pemenang
procedure tampilkanPemenang(jmlhPemain : byte);

begin
    for i := 0 to jmlhPemain - 1 do 
        begin
            gotoXY(1,i+5);writeln(i+1);
            gotoXY(9,i+5);writeln('|');
            gotoXY(11,i+5);writeln(namaPemain[i]);
            gotoXY(30,i+5);writeln('|');
            gotoXY(32,i+5);writeln(skorPemain[i]);
            gotoXY(37,i+5);writeln('|');
            gotoXY(39,i+5);writeln(selisihSkor[i]);
        end;
end;

//prosedur cek ada atau tidaknya tie breaker
procedure cek;
var banyak : byte;
begin
    setlength(pemainSeri, 5);
    banyak := 0;
    for i := 1 to jmlhPemain-1 do 
    begin
        if selisihSkor[i] = selisihSkor[i+1] then
        begin
            tie := true;
            banyak := banyak + 1;
            pemainSeri[i] := namaPemain[i];
            pemainSeri[i+1] := namaPemain[i+1];
            x := i;
        end;
    end;
    banyakSeri := banyak + 1;
end;

//prosedur game tie breaker
procedure tiebreaker;
var j, k, skorPemainSeri, temp5  : byte;
    temp4 : array [1..5] of byte;
begin 
    writeln;
    writeln('Game Tiebreaker');
    for k := 0 to banyakSeri-1 do
    begin
        skorPemainSeri := lemparDadu;
        temp4[k] := skorPemainSeri;
        writeln('Dadu ',pemainSeri[x+k],' : ', skorPemainSeri);
        readkey;
    end;
    k := 0;
    for i := 0 to banyakSeri-2 do
    begin
        for j := 1 to banyakSeri-1 do
        begin
            if(temp4[j] > temp4[i]) then
            begin
                temp5 := temp4[i];
                temp4[i] := temp4[j];
                temp4[j] := temp5;
            end;
        end;
    end;
    for k := 0 to banyakSeri-1 do
        writeln ('Ranking ',x+k+1,' : ', pemainSeri[x+k],' ,skor ', temp4[k]);
    k := 0;
    for k := 0 to banyakSeri-1 do
    begin
        if temp4[k] = temp4[k+1] then
            tiebreaker;
    end;
end;

begin
    writeln('===========================================');
    writeln('Selamat Datang di Game Dadu Kelompok 6A6!!!');
    writeln('===========================================');
    writeln('NOTE: Pemain maksimal berjumlah 5 orang');
    writeln;
    write('Masukkan jumlah pemain: ');
    readln(jmlhPemain);
    write('Masukkan skor target: ');
    readln(skorTarget);
    //menentukan ukuran array berdasarkan jumlah pemain
    setlength(namaPemain, jmlhPemain);
    setlength(skorPemain, jmlhPemain);
    setlength(selisihSkor, jmlhPemain);
    //tambah nama pemain
    writeln;
    for i := 0 to jmlhPemain - 1 do
        begin
            skorPemain[i] := 0;
            write('Nama pemain ke-',i+1,' : ');
            readln(namaPemain[i]);
        end;
    clrscr;
    //bermain dan akumulasi skor
    i := 1;
    while(i <= 3) do
        begin
            bermain(jmlhPemain);
            i += 1;
        end;
    //mencari selisih skor pemain dan skor target
    mencariSelisih(jmlhPemain);
    //mengurutkan selisih dari yang terkecil sampai terbesar
    sort(jmlhPemain);

    //cari pemenang berdasarkan selisih terkecil dan tampilkan pemenang

    clrscr;
    writeln('Skor Target : ', skorTarget); 
    writeln('===================================================');
    gotoXY(1,3);writeln('Ranking');
    gotoXY(9,3);writeln('|');
    gotoXY(11,3);writeln('Nama');
    gotoXY(30,3);writeln('|');
    gotoXY(32,3);writeln('Skor');
    gotoXY(37,3);writeln('|');
    gotoXY(39,3);writeln('SelisihSkor');
    writeln('===================================================');
    tampilkanPemenang(jmlhPemain);
    //cek ada tie breaker atau engga
    cek;
        //jika ada
        if tie = true then
            //memanggil prosedur untuk game tie breaker dan tampilkan pemenang setelah tie breaker
            tiebreaker
        //jika tidak
        else 
            //end
end.
