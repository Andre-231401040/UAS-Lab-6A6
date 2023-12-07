program gameDadu;

uses crt;

label awal, bertanya;

var
jawaban : char;
ulang : boolean;
i, jumlahPemainTieBreaker, jmlhPemain, skorTarget : integer;
skorPemain, selisihSkor, skorTieBreak, selisihSkorPesertaTieBreak : array of integer;
namaPemain, pemainTieBreaker : array of string;

//function acak dadu
function lemparDadu:integer;
begin
    randomize;
    lemparDadu := random(5)+1;
end;

//prosedur bermain dan akumulasi skor
procedure bermain(jmlhPemain : integer);
var
i, angkaDadu : integer;
begin
    for i := 0 to jmlhPemain - 1 do
        begin
            writeln('Pemain ke-',i+1,' atau ',namaPemain[i]);
            angkaDadu := lemparDadu;
            skorPemain[i] += angkaDadu;
            writeln('Dadu anda bernilai ',angkaDadu);
            writeln('Skor anda saat ini: ',skorPemain[i]);
            readln;
            writeln;
        end;
end;

//prosedur mencari selisih
procedure mencariSelisih(jmlhPemain : integer);
var
i : integer;
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

//prosedur mengurutkan selisih dari yang terkecil sampai terbesar dan ranking pemain
procedure sort(jmlhPemain : integer);
var
i, j, temp1,temp3 : integer;
temp2 : string;
begin
    for i := 0 to jmlhPemain - 2 do
        begin
            for j := i+1 to jmlhPemain - 1 do
                begin
                    if(selisihSkor[j] < selisihSkor[i]) then
                        begin
                            temp1 := selisihSkor[i];
                            selisihSkor[i] := selisihSkor[j];
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
procedure tampilkanPemenang(jmlhPemain : integer);
var
i : integer;
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

//prosedur cek ada tie breaker atau tidak
procedure cekTieBreak;
begin
    while(i <= jmlhPemain - 1) do
        begin
            if(selisihSkor[i] = selisihSkor[i+1]) then
                begin
                    pemainTieBreaker[jumlahPemainTieBreaker] := namaPemain[i];
                    selisihSkorPesertaTieBreak[jumlahPemainTieBreaker] := selisihSkor[i];
                    jumlahPemainTieBreaker += 1;
                    i += 1; 
                end
            else if(selisihSkor[i] = selisihSkor[i-1]) then
                begin
                    pemainTieBreaker[jumlahPemainTieBreaker] := namaPemain[i];
                    selisihSkorPesertaTieBreak[jumlahPemainTieBreaker] := selisihSkor[i];
                    jumlahPemainTieBreaker += 1;
                    i += 1;
                end
            else
                begin
                    i += 1;
                end;
        end;
end;

//prosedur game tie breaker
procedure tieBreak(jumlahPemainTieBreaker : integer);
var
i, j, sameScoreCounter : integer;
begin
    clrscr;
    ulang := true;
    while(ulang) do
        begin
            sameScoreCounter := 0;
            for i := 0 to jumlahPemainTieBreaker - 1 do
                begin
                    writeln('Pemain ke-',i+1,' atau ',pemainTieBreaker[i]);
                    skorTieBreak[i] := lemparDadu;
                    writeln('Dadu anda bernilai ',skorTieBreak[i]);
                    readln;
                end;

            for i := 0 to jumlahPemainTieBreaker - 2 do
                begin
                    for j := i+1 to jumlahPemainTieBreaker - 1 do
                        begin
                            if(skorTieBreak[i] = skorTieBreak[j]) then
                                begin
                                    if(selisihSkorPesertaTieBreak[i] = selisihSkorPesertaTieBreak[j]) then
                                        begin
                                            sameScoreCounter += 1;
                                        end;
                                end;
                        end;
                end;

            //cek ada skor yang sama atau engga
            if(sameScoreCounter = 0) then
                begin
                    ulang := false;
                end;
        end;
end;

begin
    awal:
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
    setlength(pemainTieBreaker, jmlhPemain);
    setlength(selisihSkorPesertaTieBreak, jmlhPemain);

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
            clrscr;
            writeln('Putaran ke-',i);
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
    gotoXY(39,3);writeln('Selisih Skor');
    writeln('===================================================');
    tampilkanPemenang(jmlhPemain);
    write('Tekan enter untuk lanjut...');
    readln;

    //cek ada tie breaker atau engga
    i := 0;
    jumlahPemainTieBreaker := 0;
    cekTieBreak;

    //set ukuran array untuk skorTieBreak berdasarkan jumlahPemainTieBreaker
    setlength(skorTieBreak, jumlahPemainTieBreaker);

    if(jumlahPemainTieBreaker = 0) then
        begin
            writeln(jumlahPemainTieBreaker);
            goto bertanya;
        end
    else
        begin
            clrscr;
            writeln('==================================');
            writeln('Selamat datang di game tie breaker');
            writeln('==================================');
            writeln('Peserta tie breaker: ');
            for i := 0 to jumlahPemainTieBreaker - 1 do
                begin
                    writeln(i+1,'. ',pemainTieBreaker[i]);
                end;
            write('Klik tombol enter untuk lanjut bermain...');
            readln;
            tieBreak(jumlahPemainTieBreaker);
        end;

    //menampilkan pemenang setelah tie break
    clrscr;
    writeln('Skor Target : ', skorTarget); 
    writeln('===================================================');
    gotoXY(1,3);writeln('Ranking');
    gotoXY(9,3);writeln('|');
    gotoXY(11,3);writeln('Nama');
    gotoXY(30,3);writeln('|');
    gotoXY(32,3);writeln('Skor');
    gotoXY(37,3);writeln('|');
    gotoXY(39,3);writeln('Selisih Skor');
    gotoXY(52,3);writeln('|');
    gotoXY(54,3);writeln('Skor Tie Break');
    writeln('===================================================');
    tampilkanPemenang(jmlhPemain);
    write('Tekan enter untuk lanjut...');
    readln;
    //bertanya kepada user pada ingin mengulang atau tidak
    bertanya:
    write('Apakah ingin lanjut bermain (Y/T): ');
    readln(jawaban);

    jawaban := upcase(jawaban);

    if(jawaban = 'Y') then
        begin
            goto awal;
        end;
    writeln('TERIMA KASIH SUDAH MENCOBA GAME KAMI!!!');
end.