/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/**
 * Fonction qui retourne la prime d'ancienneté
 * @param {type} nbAncien
 * @returns {Number
 */
function ancienneté(nbAncien) {
    const ancienneté1=300;
    const ancienneté2=30;
    if (nbAncien===4)
        return ancienneté1;
    else if (nbAncien<4)
        return 0;
    else
        return ancienneté1+(nbAncien-4)*ancienneté2;
}

/**
 * Fonction qui retourne la prime de la distance parcourue dans l'année
 * @param {type} nbdist
 * @returns {Number
 */
function distance(nbdist){
    const distance=0.01;
    const plafond=900;
    const res=nbdist*distance;
    if (res<plafond)
        return res;
    else
        return plafond;
}

/**
 * Fonction qui retourne le pourcentage de réduction de la prime à cause du nombre d'accidents
 * @param {type} nbAccidents
 * @returns {Number}
 */
function Accidents(nbAccidents){
    if (nbAccidents===1)
        return 1/2;
    else if (nbAccidents===2)
        return 1/3;
    else if (nbAccidents===0)
        return 1;
    else
        return 0;
}

function validEnvoi() {
    if (window.document.querySelector("#i_Ancienneté").value === "" ||
            window.document.querySelector("#i_dist").value === ""||
            window.document.querySelector("#i_nbAccidents").value === ""){
        alert("Tous les champs doivent être remplis"); // On affiche un message
    } 
    else {
        nbAncien = parseInt(window.document.querySelector("#i_Ancienneté").value);
        nbdist = parseInt(window.document.querySelector("#i_dist").value);
        nbAccidents = parseInt(window.document.querySelector("#i_nbAccidents").value);
        prime=ancienneté(nbAncien)+distance(nbdist)*Accidents(nbAccidents); // On peut envoyer    
        window.document.querySelector("#remuneration").innerHTML =
            "La rémunération sera de : " + prime + " €";
    }
}

window.addEventListener("load", function () {
    
    window.document.querySelector("#btn_envoyer").addEventListener("click", validEnvoi);
});