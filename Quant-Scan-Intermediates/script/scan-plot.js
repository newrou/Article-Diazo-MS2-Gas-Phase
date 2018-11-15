
<script type="text/javascript">
<!--

function FindPosition(oElement)
{
  if(typeof( oElement.offsetParent ) != "undefined")
  {
    for(var posX = 0, posY = 0; oElement; oElement = oElement.offsetParent)
    {
      posX += oElement.offsetLeft;
      posY += oElement.offsetTop;
    }
      return [ posX, posY ];
    }
    else
    {
      return [ oElement.x, oElement.y ];
    }
}

function GetCoordinates(e)
{
  var PosX = 0;
  var PosY = 0;
  var ImgPos;
  ImgPos = FindPosition(myImg);
  if (!e) var e = window.event;
  if (e.pageX || e.pageY)
  {
    PosX = e.pageX;
    PosY = e.pageY;
  }
  else if (e.clientX || e.clientY)
    {
      PosX = e.clientX + document.body.scrollLeft
        + document.documentElement.scrollLeft;
      PosY = e.clientY + document.body.scrollTop
        + document.documentElement.scrollTop;
    }
  PosX = PosX - ImgPos[0];
  PosY = PosY - ImgPos[1];
  if(PosX>75 && PosX<576 )
   {
    Ni = Math.round((PosX-75)*Nmax/500);
    Ni=Ni+1;
    if(Ni<1) Ni=1;
    if(Ni>Nmax) Ni=Nmax;
    sNi='00'+Ni;
    if(Ni>9) sNi='0'+Ni;
    if(Ni>99) sNi=''+Ni;
//    E=document.getElementById("step"+sNi).innerHTML;
    tr=document.getElementById("step"+sNi);
    d = tr.getElementsByTagName("td")[1].innerHTML;
    Eh = tr.getElementsByTagName("td")[2].innerHTML;
    E = tr.getElementsByTagName("td")[3].innerHTML;
    document.getElementById("x").innerHTML = ' Step: '+sNi+'  d='+d+'  Eh='+Eh+'  E='+E;
//    document.getElementById("x").innerHTML = ' Step: '+Ni;
//    document.getElementById("x").innerHTML = PosX+' n:'+Ni;
//    document.getElementById("y").innerHTML = PosY;
    document.getElementById("show1").src="img/fName."+sNi+".png";
   }
}

//-->
</script>
