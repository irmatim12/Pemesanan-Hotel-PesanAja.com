import streamlit as st

st.write("---------------------------- Selamat Datang di PesanAja.com--------------------------")
st.write("**********Jadikan Harimu Lebih Bermakna dengan Penginapan Kelas Executive di Bandung**********")
st.write("------------------------ Silahkan Pesan Hotel yang Anda Inginkan-----------------------------")

nama= st.text_input("Masukkan Nama Anda: ")
tanggal= st.number_input("Masukkan Tanggal Yang Akan Dipesan: ")

st.write("-------Hotel Di Bandung---------")
st.write("1. Hotel Mawar / Kamar     @300000")
st.write("2. Hotel Melati / Kamar    @400000")
st.write("3. Hotel Mentari / Kamar   @500000")
st.write("4. Hotel Tulip / Kamar     @600000")
st.write("5. Hotel Anggrek / Kamar   @700000")
st.write("   ---- MENU ----")

booking_hotel = int(st.number_input("Masukan booking hotel (nomer booking) :"))

if booking_hotel==1:
   harga = 300000
elif booking_hotel==2:
     harga = 400000
elif booking_hotel==3:
     harga = 500000
elif booking_hotel==4:
     harga = 600000
elif booking_hotel==5:
     harga = 700000
else :
    while True:
        st.write("-----Hotel Tidak Tersedia, Silahkan Pilih Hotel Lainnya!!-----")
        booking_hotel - int(st.number_input("Masukkan booking hotel (nomer booking):"))
        if booking_hotel==1 or booking_hotel==2 or booking_hotel==3 or booking_hotel==4 or booking_hotel==5:
            if booking_hotel==1:
                harga = 300000
            elif booking_hotel==2:
                harga = 400000
            elif booking_hotel==3:
                harga = 500000
            elif booking_hotel==4:
                harga = 600000
            elif booking_hotel==5:
                harga = 700000
            break
            
    
jumlah_booking = int(st.number_input("Masukkan Jumlah Booking: "))

bayar = jumlah_booking * harga

st.write("Anda Harus Membayar: Rp.{}".format(bayar))