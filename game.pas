program gameDadu;

uses crt;

var
jmlhPemain, skorTarget : integer;
skorPemain, selisihSkor : array of integer;
lemparDadu : array of byte;
namaPemain : array of string;
i,j : integer;
//function acak dadu
//function lemparDadu: byte;
procedure Dadu;
begin
    setlength(lemparDadu, 3*jmlhPemain);
    randomize;
    for i := 1 to 3*jmlhPemain do
    begin
        lemparDadu[i] := random(5)+1;
    end;
end;

//prosedur pemain sedang bermain dan akumulasi skor
procedure akumulasiSkor;
begin
    for i:=1 to jmlhPemain do 
    begin
        skorPemain[i] := 0;
        for j:= ((3*i)-2) to 3*i do 
        begin
            writeln('Dadu ke- ',((j-1) mod 3) +1,' : ',lemparDadu[j]);
            skorPemain[i] := skorPemain[i] + lemparDadu[j];
            readkey;
        end;
        writeln('Total Skor Pemain ',i,' adalah ',skorPemain[i]);
        readkey;
    end; 
end;

//prosedur mencari selisih

//prosedur tampilkan pemenang

//prosedur cek ada atau tidaknya tie breaker

//prosedur game tie breaker

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

    //memanggil prosedur bermain dan akumulasi skor masing-masing pemain
    Dadu;
    akumulasiSkor;

    //memanggil prosedur mencari selisih skor pemain dan skor target

    //memanggil prosedur mencari pemenang dan tampilkan pemenang

    //cek ada tie breaker atau engga
        //jika ada
            //memanggil prosedur untuk game tie breaker dan tampilkan pemenang setelah tie breaker

        //jika tidak
            //end
            
end.
