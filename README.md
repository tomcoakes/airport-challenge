#Airport Challenge

I've built an airport/airplane model based on the challenge found here: https://s3.amazonaws.com/uploads.hipchat.com/119067/1081663/abBL2ggunBfTN3A/image.jpg

I strayed from the original specification slightly by deciding that the planes themselves would have a land_at/take_off method, which would then in turn speak to the airport in question for permission to land/take off. The airport then checks for available gates and the current weather to decide whether to grant the plane permission.

####Airports
  - **Gates Context**
    - are able to hold airplanes at gates
    - know how many gates are in use
  - **Traffic Control Context**
    - allow incoming planes to land
    - allow planes to take off
    - don't allow planes to land when at max capacity
  - **Stormy Weather Context**
    - don't allow planes to land when it's stormy
    - don't allow planes to take off when it's stormy


####Planes
  - **Flying Status**
    - are able to fly
    - stop flying when they land
    - aren't already flying when created
    - begin flying when they take off
  - **Dealing With Airports Context**
    - are assigned a starting airport when created
    - are able to land at an airport
    - know which airport they're currently at
    - are able to take off

####Weather
- is sometimes stormy
- is sometimes sunny
