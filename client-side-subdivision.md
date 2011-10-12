# Uppdelning av deluppgifter i webklienten

## Vektorgrafik
- Vehicle-objekt
  - skall gå att hålla koll på nuvarande position (borde vara gratis i raphael)
  - funktioner:
    - vehicle.startTowards({x: xVal, y: yVal}), startar fordonet på en path rakt till den givna punkten
    - vehicle.setNewTime(<tid>), fordonet beräknar ny hastighet med hjälp av nuvarande pixelavstånd och den nya tiden
    - vehicle.stop(), kan behövas vid störningar?
    - vehicle.displayDisruptionMessage(<meddelande>), fordonet visar blinkande varningssignal, kanske med ett meddelande?
  

## Web-socket
- Websocketmodul som abstraktionslager
  - leverar parsad data i format som är direkt användbar för resten av applikationen
  - räknar således ut tidsoffset och dylikt