/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


const fixe = 1100;
//let balisenbAncien = document.getElementById("i_Ancienneté");
  //  let nbAncien = balisenbAncien.value;
function ancienneté(fixe,nbAncien) {
    
    const ancienneté_plus_de_5ans = fixe+0.03*fixe;
const ancienneté_plus_de_10ans = fixe+0.06*fixe;
    if (nbAncien<5)
        return fixe;
    else if (nbAncien<10)
        return ancienneté_plus_de_5ans;
    else
        return ancienneté_plus_de_10ans;
}

function commission_S_20(nbS20) {
    const prix_S_20 = 140;
    const comm_S_20 = 0.02;
    return nbS20*prix_S_20*comm_S_20;
}

function commission_X_Spirit(nbXS) {
    const prix_X_Spirit = 350;
    const comm_X_Spirit = 0.06;
    if (nbXS > 50)
        return (nbXS-50)*prix_X_Spirit*comm_X_Spirit;
    else
        return 0;
}

function commission_Multitec(nbMulti) {
    const prix_Multitec = 180;
    const comm_Multitec_moinsde20 = prix_Multitec*0.04;
    const comm_Multitec_moinsde50 = prix_Multitec*0.06;
    const comm_Multitec_plusde50 = prix_Multitec*0.1;
    if (nbMulti<20)
        return nbMulti*comm_Multitec_moinsde20;
    else if (nbMulti<50)
        return (nbMulti-20)*comm_Multitec_moinsde50+20*comm_Multitec_moinsde20;
    else
        return (nbMulti-50)*comm_Multitec_plusde50+30*comm_Multitec_moinsde50+20*comm_Multitec_moinsde20;
}
function indemnitékm(nbkm){
    const indemnité=0.15;
    if (nbkm<350)
        return nbkm*indemnité;
    else
        return 350*indemnité;
}

function validEnvoi() {
    if (window.document.querySelector("#i_Ancienneté").value === "" ||
            window.document.querySelector("#i_nbS20").value === ""||
            window.document.querySelector("#i_nbXSpirit").value === ""||
            window.document.querySelector("#i_nbMultitec").value === ""){
        alert("Tous les champs doivent être remplis"); // On affiche un message
    } 
    else {
        nbkm = parseInt(window.document.querySelector("#i_nbkm").value);
        nbS20 = parseInt(window.document.querySelector("#i_nbS20").value);
        nbXS = parseInt(window.document.querySelector("#i_nbXSpirit").value);
        nbMulti = parseInt(window.document.querySelector("#i_nbMultitec").value);
        nbAncien = parseInt(window.document.querySelector("#i_Ancienneté").value);
        remuneration=ancienneté(1100, nbAncien)+ commission_S_20(nbS20) + commission_X_Spirit(nbXS) + commission_Multitec(nbMulti) + indemnitékm(nbkm); // On peut envoyer    
        window.document.querySelector("#i_Salaire").value = remuneration;
    }
}

//window.document.querySelector("#i_Salaire").value.innerHTML = remuneration ;
window.addEventListener("load", function () {
    
    window.document.querySelector("#btn_envoyer").addEventListener("click", validEnvoi);
});
