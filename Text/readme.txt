tema özelligi verirken ;

- class içerisinde sabit style lar oluşturup textlere atamak 
- Direk theme üzerinden styleları okuyarak sonrasında istediğimiz gibi themakları manüpüle etmek 

Farz_ı misal :) 
projenin birden fazla yerinde aynı Decoration'u kullanıyorsak ve tekrara düşmek istemiyorsak 
ortak olan decorationları bir classın constructoru içerisinde toplarız ve bu classı da Box decoration a 
extends ettirerek super anahtar kelimesi sayesinde ortak olan elemanlarımızı tanımlarız. Sonra tek gereken 
ihtiyacımız olan yerlerde bu classtan objeler türetmektir. 



