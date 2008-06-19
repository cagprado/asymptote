import surface;
currentprojection=orthographic(0,-10,0);

triple[][][] Q={
  {
    {(39.68504,0.0,68.03150),(39.68504,-22.22362,68.03150),(22.22362,-39.68504,68.03150),(0.0,-39.68504,68.03150)},
    {(37.91339,0.0,71.75197),(37.91339,-21.23150,71.75197),(21.23150,-37.91339,71.75197),(0.0,-37.91339,71.75197)},
    {(40.74803,0.0,71.75197),(40.74803,-22.81890,71.75197),(22.81890,-40.74803,71.75197),(0.0,-40.74803,71.75197)},
    {(42.51969,0.0,68.03150),(42.51969,-23.81102,68.03150),(23.81102,-42.51969,68.03150),(0.0,-42.51969,68.03150)},
  },
  {
    {(0.0,-39.68504,68.03150),(-22.22362,-39.68504,68.03150),(-39.68504,-22.22362,68.03150),(-39.68504,0.0,68.03150)},
    {(0.0,-37.91339,71.75197),(-21.23150,-37.91339,71.75197),(-37.91339,-21.23150,71.75197),(-37.91339,0.0,71.75197)},
    {(0.0,-40.74803,71.75197),(-22.81890,-40.74803,71.75197),(-40.74803,-22.81890,71.75197),(-40.74803,0.0,71.75197)},
    {(0.0,-42.51969,68.03150),(-23.81102,-42.51969,68.03150),(-42.51969,-23.81102,68.03150),(-42.51969,0.0,68.03150)},
  },
  {
    {(-39.68504,0.0,68.03150),(-39.68504,22.22362,68.03150),(-22.22362,39.68504,68.03150),(0.0,39.68504,68.03150)},
    {(-37.91339,0.0,71.75197),(-37.91339,21.23150,71.75197),(-21.23150,37.91339,71.75197),(0.0,37.91339,71.75197)},
    {(-40.74803,0.0,71.75197),(-40.74803,22.81890,71.75197),(-22.81890,40.74803,71.75197),(0.0,40.74803,71.75197)},
    {(-42.51969,0.0,68.03150),(-42.51969,23.81102,68.03150),(-23.81102,42.51969,68.03150),(0.0,42.51969,68.03150)},
  },
  {
    {(0.0,39.68504,68.03150),(22.22362,39.68504,68.03150),(39.68504,22.22362,68.03150),(39.68504,0.0,68.03150)},
    {(0.0,37.91339,71.75197),(21.23150,37.91339,71.75197),(37.91339,21.23150,71.75197),(37.91339,0.0,71.75197)},
    {(0.0,40.74803,71.75197),(22.81890,40.74803,71.75197),(40.74803,22.81890,71.75197),(40.74803,0.0,71.75197)},
    {(0.0,42.51969,68.03150),(23.81102,42.51969,68.03150),(42.51969,23.81102,68.03150),(42.51969,0.0,68.03150)},
  },
  {
    {(42.51969,0.0,68.03150),(42.51969,-23.81102,68.03150),(23.81102,-42.51969,68.03150),(0.0,-42.51969,68.03150)},
    {(49.60629,0.0,53.14960),(49.60629,-27.77952,53.14960),(27.77952,-49.60629,53.14960),(0.0,-49.60629,53.14960)},
    {(56.69291,0.0,38.26771),(56.69291,-31.74803,38.26771),(31.74803,-56.69291,38.26771),(0.0,-56.69291,38.26771)},
    {(56.69291,0.0,25.51181),(56.69291,-31.74803,25.51181),(31.74803,-56.69291,25.51181),(0.0,-56.69291,25.51181)},
  },
  {
    {(0.0,-42.51969,68.03150),(-23.81102,-42.51969,68.03150),(-42.51969,-23.81102,68.03150),(-42.51969,0.0,68.03150)},
    {(0.0,-49.60629,53.14960),(-27.77952,-49.60629,53.14960),(-49.60629,-27.77952,53.14960),(-49.60629,0.0,53.14960)},
    {(0.0,-56.69291,38.26771),(-31.74803,-56.69291,38.26771),(-56.69291,-31.74803,38.26771),(-56.69291,0.0,38.26771)},
    {(0.0,-56.69291,25.51181),(-31.74803,-56.69291,25.51181),(-56.69291,-31.74803,25.51181),(-56.69291,0.0,25.51181)},
  },
  {
    {(-42.51969,0.0,68.03150),(-42.51969,23.81102,68.03150),(-23.81102,42.51969,68.03150),(0.0,42.51969,68.03150)},
    {(-49.60629,0.0,53.14960),(-49.60629,27.77952,53.14960),(-27.77952,49.60629,53.14960),(0.0,49.60629,53.14960)},
    {(-56.69291,0.0,38.26771),(-56.69291,31.74803,38.26771),(-31.74803,56.69291,38.26771),(0.0,56.69291,38.26771)},
    {(-56.69291,0.0,25.51181),(-56.69291,31.74803,25.51181),(-31.74803,56.69291,25.51181),(0.0,56.69291,25.51181)},
  },
  {
    {(0.0,42.51969,68.03150),(23.81102,42.51969,68.03150),(42.51969,23.81102,68.03150),(42.51969,0.0,68.03150)},
    {(0.0,49.60629,53.14960),(27.77952,49.60629,53.14960),(49.60629,27.77952,53.14960),(49.60629,0.0,53.14960)},
    {(0.0,56.69291,38.26771),(31.74803,56.69291,38.26771),(56.69291,31.74803,38.26771),(56.69291,0.0,38.26771)},
    {(0.0,56.69291,25.51181),(31.74803,56.69291,25.51181),(56.69291,31.74803,25.51181),(56.69291,0.0,25.51181)},
  },
  {
    {(56.69291,0.0,25.51181),(56.69291,-31.74803,25.51181),(31.74803,-56.69291,25.51181),(0.0,-56.69291,25.51181)},
    {(56.69291,0.0,12.75590),(56.69291,-31.74803,12.75590),(31.74803,-56.69291,12.75590),(0.0,-56.69291,12.75590)},
    {(42.51969,0.0,6.377957),(42.51969,-23.81102,6.377957),(23.81102,-42.51969,6.377957),(0.0,-42.51969,6.377957)},
    {(42.51969,0.0,4.251961),(42.51969,-23.81102,4.251961),(23.81102,-42.51969,4.251961),(0.0,-42.51969,4.251961)},
  },
  {
    {(0.0,-56.69291,25.51181),(-31.74803,-56.69291,25.51181),(-56.69291,-31.74803,25.51181),(-56.69291,0.0,25.51181)},
    {(0.0,-56.69291,12.75590),(-31.74803,-56.69291,12.75590),(-56.69291,-31.74803,12.75590),(-56.69291,0.0,12.75590)},
    {(0.0,-42.51969,6.377957),(-23.81102,-42.51969,6.377957),(-42.51969,-23.81102,6.377957),(-42.51969,0.0,6.377957)},
    {(0.0,-42.51969,4.251961),(-23.81102,-42.51969,4.251961),(-42.51969,-23.81102,4.251961),(-42.51969,0.0,4.251961)},
  },
  {
    {(-56.69291,0.0,25.51181),(-56.69291,31.74803,25.51181),(-31.74803,56.69291,25.51181),(0.0,56.69291,25.51181)},
    {(-56.69291,0.0,12.75590),(-56.69291,31.74803,12.75590),(-31.74803,56.69291,12.75590),(0.0,56.69291,12.75590)},
    {(-42.51969,0.0,6.377957),(-42.51969,23.81102,6.377957),(-23.81102,42.51969,6.377957),(0.0,42.51969,6.377957)},
    {(-42.51969,0.0,4.251961),(-42.51969,23.81102,4.251961),(-23.81102,42.51969,4.251961),(0.0,42.51969,4.251961)},
  },
  {
    {(0.0,56.69291,25.51181),(31.74803,56.69291,25.51181),(56.69291,31.74803,25.51181),(56.69291,0.0,25.51181)},
    {(0.0,56.69291,12.75590),(31.74803,56.69291,12.75590),(56.69291,31.74803,12.75590),(56.69291,0.0,12.75590)},
    {(0.0,42.51969,6.377957),(23.81102,42.51969,6.377957),(42.51969,23.81102,6.377957),(42.51969,0.0,6.377957)},
    {(0.0,42.51969,4.251961),(23.81102,42.51969,4.251961),(42.51969,23.81102,4.251961),(42.51969,0.0,4.251961)},
  },
  {
    {(-45.35433,0.0,57.40157),(-45.35433,-8.503932,57.40157),(-42.51969,-8.503932,63.77952),(-42.51969,0.0,63.77952)},
    {(-65.19685,0.0,57.40157),(-65.19685,-8.503932,57.40157),(-70.86614,-8.503932,63.77952),(-70.86614,0.0,63.77952)},
    {(-76.53543,0.0,57.40157),(-76.53543,-8.503932,57.40157),(-85.03937,-8.503932,63.77952),(-85.03937,0.0,63.77952)},
    {(-76.53543,0.0,51.02362),(-76.53543,-8.503932,51.02362),(-85.03937,-8.503932,51.02362),(-85.03937,0.0,51.02362)},
  },
  {
    {(-42.51969,0.0,63.77952),(-42.51969,8.503932,63.77952),(-45.35433,8.503932,57.40157),(-45.35433,0.0,57.40157)},
    {(-70.86614,0.0,63.77952),(-70.86614,8.503932,63.77952),(-65.19685,8.503932,57.40157),(-65.19685,0.0,57.40157)},
    {(-85.03937,0.0,63.77952),(-85.03937,8.503932,63.77952),(-76.53543,8.503932,57.40157),(-76.53543,0.0,57.40157)},
    {(-85.03937,0.0,51.02362),(-85.03937,8.503932,51.02362),(-76.53543,8.503932,51.02362),(-76.53543,0.0,51.02362)},
  },
  {
    {(-76.53543,0.0,51.02362),(-76.53543,-8.503932,51.02362),(-85.03937,-8.503932,51.02362),(-85.03937,0.0,51.02362)},
    {(-76.53543,0.0,44.64566),(-76.53543,-8.503932,44.64566),(-85.03937,-8.503932,38.26771),(-85.03937,0.0,38.26771)},
    {(-70.86614,0.0,31.88976),(-70.86614,-8.503932,31.88976),(-75.11811,-8.503932,26.57480),(-75.11811,0.0,26.57480)},
    {(-56.69291,0.0,25.51181),(-56.69291,-8.503932,25.51181),(-53.85826,-8.503932,17.00787),(-53.85826,0.0,17.00787)},
  },
  {
    {(-85.03937,0.0,51.02362),(-85.03937,8.503932,51.02362),(-76.53543,8.503932,51.02362),(-76.53543,0.0,51.02362)},
    {(-85.03937,0.0,38.26771),(-85.03937,8.503932,38.26771),(-76.53543,8.503932,44.64566),(-76.53543,0.0,44.64566)},
    {(-75.11811,0.0,26.57480),(-75.11811,8.503932,26.57480),(-70.86614,8.503932,31.88976),(-70.86614,0.0,31.88976)},
    {(-53.85826,0.0,17.00787),(-53.85826,8.503932,17.00787),(-56.69291,8.503932,25.51181),(-56.69291,0.0,25.51181)},
  },
  {
    {(48.18897,0.0,40.39370),(48.18897,-18.70866,40.39370),(48.18897,-18.70866,17.00787),(48.18897,0.0,17.00787)},
    {(73.70078,0.0,40.39370),(73.70078,-18.70866,40.39370),(87.87401,-18.70866,23.38582),(87.87401,0.0,23.38582)},
    {(65.19685,0.0,59.52755),(65.19685,-7.086619,59.52755),(68.03150,-7.086619,57.40157),(68.03150,0.0,57.40157)},
    {(76.53543,0.0,68.03150),(76.53543,-7.086619,68.03150),(93.54330,-7.086619,68.03150),(93.54330,0.0,68.03150)},
  },
  {
    {(48.18897,0.0,17.00787),(48.18897,18.70866,17.00787),(48.18897,18.70866,40.39370),(48.18897,0.0,40.39370)},
    {(87.87401,0.0,23.38582),(87.87401,18.70866,23.38582),(73.70078,18.70866,40.39370),(73.70078,0.0,40.39370)},
    {(68.03150,0.0,57.40157),(68.03150,7.086619,57.40157),(65.19685,7.086619,59.52755),(65.19685,0.0,59.52755)},
    {(93.54330,0.0,68.03150),(93.54330,7.086619,68.03150),(76.53543,7.086619,68.03150),(76.53543,0.0,68.03150)},
  },
  {
    {(76.53543,0.0,68.03150),(76.53543,-7.086619,68.03150),(93.54330,-7.086619,68.03150),(93.54330,0.0,68.03150)},
    {(79.37007,0.0,70.15748),(79.37007,-7.086619,70.15748),(99.92125,-7.086619,70.68897),(99.92125,0.0,70.68897)},
    {(82.20472,0.0,70.15748),(82.20472,-4.251961,70.15748),(97.79527,-4.251961,71.22047),(97.79527,0.0,71.22047)},
    {(79.37007,0.0,68.03150),(79.37007,-4.251961,68.03150),(90.70866,-4.251961,68.03150),(90.70866,0.0,68.03150)},
  },
  {
    {(93.54330,0.0,68.03150),(93.54330,7.086619,68.03150),(76.53543,7.086619,68.03150),(76.53543,0.0,68.03150)},
    {(99.92125,0.0,70.68897),(99.92125,7.086619,70.68897),(79.37007,7.086619,70.15748),(79.37007,0.0,70.15748)},
    {(97.79527,0.0,71.22047),(97.79527,4.251961,71.22047),(82.20472,4.251961,70.15748),(82.20472,0.0,70.15748)},
    {(90.70866,0.0,68.03150),(90.70866,4.251961,68.03150),(79.37007,4.251961,68.03150),(79.37007,0.0,68.03150)},
  },
  {
    {(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133)},
    {(22.67716,0.0,89.29133),(22.67716,-12.75590,89.29133),(12.75590,-22.67716,89.29133),(0.0,-22.67716,89.29133)},
    {(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740)},
    {(5.669294,0.0,76.53543),(5.669294,-3.174809,76.53543),(3.174809,-5.669294,76.53543),(0.0,-5.669294,76.53543)},
  },
  {
    {(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133)},
    {(0.0,-22.67716,89.29133),(-12.75590,-22.67716,89.29133),(-22.67716,-12.75590,89.29133),(-22.67716,0.0,89.29133)},
    {(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740)},
    {(0.0,-5.669294,76.53543),(-3.174809,-5.669294,76.53543),(-5.669294,-3.174809,76.53543),(-5.669294,0.0,76.53543)},
  },
  {
    {(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133)},
    {(-22.67716,0.0,89.29133),(-22.67716,12.75590,89.29133),(-12.75590,22.67716,89.29133),(0.0,22.67716,89.29133)},
    {(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740)},
    {(-5.669294,0.0,76.53543),(-5.669294,3.174809,76.53543),(-3.174809,5.669294,76.53543),(0.0,5.669294,76.53543)},
  },
  {
    {(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133),(0.0,0.0,89.29133)},
    {(0.0,22.67716,89.29133),(12.75590,22.67716,89.29133),(22.67716,12.75590,89.29133),(22.67716,0.0,89.29133)},
    {(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740),(0.0,0.0,80.78740)},
    {(0.0,5.669294,76.53543),(3.174809,5.669294,76.53543),(5.669294,3.174809,76.53543),(5.669294,0.0,76.53543)},
  },
  {
    {(5.669294,0.0,76.53543),(5.669294,-3.174809,76.53543),(3.174809,-5.669294,76.53543),(0.0,-5.669294,76.53543)},
    {(11.33858,0.0,72.28346),(11.33858,-6.349609,72.28346),(6.349609,-11.33858,72.28346),(0.0,-11.33858,72.28346)},
    {(36.85039,0.0,72.28346),(36.85039,-20.63622,72.28346),(20.63622,-36.85039,72.28346),(0.0,-36.85039,72.28346)},
    {(36.85039,0.0,68.03150),(36.85039,-20.63622,68.03150),(20.63622,-36.85039,68.03150),(0.0,-36.85039,68.03150)},
  },
  {
    {(0.0,-5.669294,76.53543),(-3.174809,-5.669294,76.53543),(-5.669294,-3.174809,76.53543),(-5.669294,0.0,76.53543)},
    {(0.0,-11.33858,72.28346),(-6.349609,-11.33858,72.28346),(-11.33858,-6.349609,72.28346),(-11.33858,0.0,72.28346)},
    {(0.0,-36.85039,72.28346),(-20.63622,-36.85039,72.28346),(-36.85039,-20.63622,72.28346),(-36.85039,0.0,72.28346)},
    {(0.0,-36.85039,68.03150),(-20.63622,-36.85039,68.03150),(-36.85039,-20.63622,68.03150),(-36.85039,0.0,68.03150)},
  },
  {
    {(-5.669294,0.0,76.53543),(-5.669294,3.174809,76.53543),(-3.174809,5.669294,76.53543),(0.0,5.669294,76.53543)},
    {(-11.33858,0.0,72.28346),(-11.33858,6.349609,72.28346),(-6.349609,11.33858,72.28346),(0.0,11.33858,72.28346)},
    {(-36.85039,0.0,72.28346),(-36.85039,20.63622,72.28346),(-20.63622,36.85039,72.28346),(0.0,36.85039,72.28346)},
    {(-36.85039,0.0,68.03150),(-36.85039,20.63622,68.03150),(-20.63622,36.85039,68.03150),(0.0,36.85039,68.03150)},
  },
  {
    {(0.0,5.669294,76.53543),(3.174809,5.669294,76.53543),(5.669294,3.174809,76.53543),(5.669294,0.0,76.53543)},
    {(0.0,11.33858,72.28346),(6.349609,11.33858,72.28346),(11.33858,6.349609,72.28346),(11.33858,0.0,72.28346)},
    {(0.0,36.85039,72.28346),(20.63622,36.85039,72.28346),(36.85039,20.63622,72.28346),(36.85039,0.0,72.28346)},
    {(0.0,36.85039,68.03150),(20.63622,36.85039,68.03150),(36.85039,20.63622,68.03150),(36.85039,0.0,68.03150)},
  },
  {
    {(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0)},
    {(40.39370,0.0,0.0),(40.39370,22.62047,0.0),(22.62047,40.39370,0.0),(0.0,40.39370,0.0)},
    {(42.51969,0.0,2.12598),(42.51969,23.81102,2.12598),(23.81102,42.51969,2.12598),(0.0,42.51969,2.12598)},
    {(42.51969,0.0,4.251961),(42.51969,23.81102,4.251961),(23.81102,42.51969,4.251961),(0.0,42.51969,4.251961)},
  },
  {
    {(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0)},
    {(0.0,40.39370,0.0),(-22.62047,40.39370,0.0),(-40.39370,22.62047,0.0),(-40.39370,0.0,0.0)},
    {(0.0,42.51969,2.12598),(-23.81102,42.51969,2.12598),(-42.51969,23.81102,2.12598),(-42.51969,0.0,2.12598)},
    {(0.0,42.51969,4.251961),(-23.81102,42.51969,4.251961),(-42.51969,23.81102,4.251961),(-42.51969,0.0,4.251961)},
  },
  {
    {(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0)},
    {(-40.39370,0.0,0.0),(-40.39370,-22.62047,0.0),(-22.62047,-40.39370,0.0),(0.0,-40.39370,0.0)},
    {(-42.51969,0.0,2.12598),(-42.51969,-23.81102,2.12598),(-23.81102,-42.51969,2.12598),(0.0,-42.51969,2.12598)},
    {(-42.51969,0.0,4.251961),(-42.51969,-23.81102,4.251961),(-23.81102,-42.51969,4.251961),(0.0,-42.51969,4.251961)},
  },
  {
    {(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0),(0.0,0.0,0.0)},
    {(0.0,-40.39370,0.0),(22.62047,-40.39370,0.0),(40.39370,-22.62047,0.0),(40.39370,0.0,0.0)},
    {(0.0,-42.51969,2.12598),(23.81102,-42.51969,2.12598),(42.51969,-23.81102,2.12598),(42.51969,0.0,2.12598)},
    {(0.0,-42.51969,4.251961),(23.81102,-42.51969,4.251961),(42.51969,-23.81102,4.251961),(42.51969,0.0,4.251961)},
  }
};


frame f;
for(int i=0; i < Q.length; ++i)
  draw(f,Q[i],blue);

currentprojection = perspective((10cm,-10cm,5cm),target=(0,0,1.5cm));
add3(f,10cm);
