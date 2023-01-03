<!DOCTYPE html>

<html>
<head>
<script>
/* Original URL: https://challenge.crossmint.io */
const userAction = async (userObj, method, endpoint) => {
	  const response = await fetch('http://localhost:8010/proxy/api/'+endpoint, {     // proxy was needed - replace URL      
	        method: method,
	        body: JSON.stringify(userObj),
	        headers: {"Content-type": "application/json; charset=UTF-8"}
	    });
	  const myJson = await response;
	  console.log(myJson);
	  return response;
}

const postMegaverse = () => {
	let userObj = {
			candidateId: "148a44f2-64c7-4ad8-9400-d69e619bf19e"
			};
	let colInv = 8; 
	
	for(let i=3; i<9; i++){
		for(let j=0; j<11; j++){
			if(i==j){
				userObj.row = i;
				userObj.column = j;
				userAction(userObj, 'POST', "polyanets");
			}
		}
	}
	
	for(let i=2; i<9; i++){
		userObj.row = i;
		userObj.column = colInv;
		colInv--;
		userAction(userObj, 'POST', "polyanets");
	}

}
const deleteMegaverse = () => {
	let userObj = {
			candidateId: "148a44f2-64c7-4ad8-9400-d69e619bf19e"
			};
	
	for(let i=0; i<11; i++){
		for(let j=0; j<11; j++){
			userObj.row = i;
			userObj.column = j;
			userAction(userObj, 'DELETE', "polyanets");
		}
	}
	
}

const getMegaverse = () => {
	let userObj = {
			candidateId: "148a44f2-64c7-4ad8-9400-d69e619bf19e"
			};
	
	const response = fetch('https://challenge.crossmint.io/api/map/148a44f2-64c7-4ad8-9400-d69e619bf19e/goal', {            
        method: 'GET',
        headers: {"Content-type": "application/json; charset=UTF-8"}
    });
  	const myJson = response;
  	console.log(response.goal);
}

const postCrossMintLogo = () => {
	let userObj = {
			candidateId: "148a44f2-64c7-4ad8-9400-d69e619bf19e"
			};
	
	for(let i=0; i<crossmintLogo.length; i++){
		for(let j=0; j<crossmintLogo[0].length; j++){
			
			if(crossmintLogo[i][j]!="SPACE"){
				let typeObj, ftr;
				let crrntObj = crossmintLogo[i][j].split("_");
				
				if(crrntObj.length==1) typeObj = crrntObj[0];
				else { typeObj = crrntObj[1]; ftr = crrntObj[0]; }
				
				userObj.row = i;
				userObj.column = j;
				
				switch (typeObj) {
				  case "POLYANET":
					delete userObj.direction;
					delete userObj.color;
					userAction(userObj, "POST", "polyanets");
				    break;
				  case "SOLOON":
					delete userObj.direction;
					userObj.color = ftr.toLowerCase();
					userAction(userObj, "POST", "soloons");
				    break;
				  case "COMETH":
					delete userObj.color;
					userObj.direction = ftr.toLowerCase();
					userAction(userObj, "POST", "comeths");
				    break;
				  default:
					console.log("NOT DEFINED");
				}
			}
		}
	}
}

const crossmintLogo = [
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "RIGHT_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "UP_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "POLYANET", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "WHITE_SOLOON", "POLYANET", "POLYANET", "SPACE", "POLYANET", "SPACE", "SPACE", "LEFT_COMETH", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "BLUE_SOLOON", "POLYANET", "POLYANET", "PURPLE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "LEFT_COMETH", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "RIGHT_COMETH"],
	["SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "WHITE_SOLOON", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "DOWN_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "BLUE_SOLOON", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "RED_SOLOON", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "PURPLE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "WHITE_SOLOON", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "BLUE_SOLOON", "POLYANET", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "PURPLE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "RED_SOLOON", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "UP_COMETH", "SPACE", "SPACE"],
	["SPACE", "SPACE", "UP_COMETH", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "PURPLE_SOLOON", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "BLUE_SOLOON", "POLYANET", "POLYANET", "SPACE", "SPACE", "POLYANET", "SPACE", "POLYANET", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "POLYANET", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "LEFT_COMETH", "SPACE", "SPACE", "DOWN_COMETH", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "RIGHT_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "WHITE_SOLOON", "POLYANET", "POLYANET", "SPACE", "POLYANET", "SPACE", "POLYANET", "POLYANET", "BLUE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "LEFT_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "POLYANET", "SPACE", "POLYANET", "SPACE", "SPACE", "POLYANET", "POLYANET", "WHITE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "RIGHT_COMETH", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "DOWN_COMETH", "SPACE", "SPACE", "POLYANET", "POLYANET", "BLUE_SOLOON", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "BLUE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "PURPLE_SOLOON", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "UP_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "PURPLE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "RED_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "WHITE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["RIGHT_COMETH", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "RED_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "WHITE_SOLOON", "POLYANET", "POLYANET", "PURPLE_SOLOON", "SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "POLYANET", "SPACE", "RED_SOLOON", "POLYANET", "POLYANET", "BLUE_SOLOON", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "LEFT_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "POLYANET", "RED_SOLOON", "SPACE", "SPACE", "DOWN_COMETH", "SPACE", "SPACE"],
	["SPACE", "SPACE", "POLYANET", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "UP_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "POLYANET", "POLYANET", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "DOWN_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "DOWN_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "UP_COMETH", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "LEFT_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "RIGHT_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "LEFT_COMETH", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"],
	["SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE", "SPACE"]
];

</script>
</head>
<body>
<h2>Hello Megaverse!</h2>
</body>
</html>
