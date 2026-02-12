
const offers = [

/* ================= FINANCE ================= */

{cat:"finance",title:"Finance Offer 1",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDQ3/"},
{cat:"finance",title:"Finance Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDQ2/"},
{cat:"finance",title:"Finance Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDQ0/"},
{cat:"finance",title:"Finance Offer 4",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDMw/"},
{cat:"finance",title:"Finance Offer 5",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTkz/"},
{cat:"finance",title:"Finance Offer 6",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTc5/"},
{cat:"finance",title:"Finance Offer 7",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTU3/"},
{cat:"finance",title:"Finance Offer 8",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTM5/"},
{cat:"finance",title:"Finance Offer 9",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTAx/"},

/* ================= ECOMMERCE ================= */

{cat:"ecommerce",title:"Ecommerce Offer 1",link:"https://track.vcommission.com/t/MTI1NTYwXzEyODU5/"},
{cat:"ecommerce",title:"Ecommerce Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzEyODM5/"},
{cat:"ecommerce",title:"Ecommerce Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzEyODI1/"},
{cat:"ecommerce",title:"Ecommerce Offer 4",link:"https://track.vcommission.com/t/MTI1NTYwXzEyNzY1/"},
{cat:"ecommerce",title:"Ecommerce Offer 5",link:"https://track.vcommission.com/t/MTI1NTYwXzEyNjcy/"},

/* ================= TRAVEL ================= */

{cat:"travel",title:"Travel Offer 1",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMTE2/"},
{cat:"travel",title:"Travel Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzEyMzcy/"},
{cat:"travel",title:"Travel Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzEyMTQ0/"},

/* ================= INSURANCE ================= */

{cat:"insurance",title:"Insurance Offer 1",link:"https://track.vcommission.com/t/MTI1NTYwXzEyMTMx/"},
{cat:"insurance",title:"Insurance Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzExODc1/"},
{cat:"insurance",title:"Insurance Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzExODc0/"},

/* ================= REST MIX ================= */

{cat:"finance",title:"Offer 22",link:"https://track.vcommission.com/t/MTI1NTYwXzExNTAx/"},
{cat:"finance",title:"Offer 23",link:"https://track.vcommission.com/t/MTI1NTYwXzExMzU1/"},
{cat:"finance",title:"Offer 24",link:"https://track.vcommission.com/t/MTI1NTYwXzExMjQx/"},
{cat:"finance",title:"Offer 25",link:"https://track.vcommission.com/t/MTI1NTYwXzExMjA2/"},
{cat:"finance",title:"Offer 26",link:"https://track.vcommission.com/t/MTI1NTYwXzExMDQz/"},
{cat:"finance",title:"Offer 27",link:"https://track.vcommission.com/t/MTI1NTYwXzEwNjY2/"},
{cat:"finance",title:"Offer 28",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMzUx/"},
{cat:"finance",title:"Offer 29",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMzIw/"},
{cat:"finance",title:"Offer 30",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMjU4/"},
{cat:"finance",title:"Offer 31",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMjQ4/"},
{cat:"finance",title:"Offer 32",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMjE5/"},
{cat:"finance",title:"Offer 33",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMjE2/"},
{cat:"finance",title:"Offer 34",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMjAz/"},
{cat:"finance",title:"Offer 35",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTk0/"},
{cat:"finance",title:"Offer 36",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTgx/"},
{cat:"finance",title:"Offer 37",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTc1/"},
{cat:"finance",title:"Offer 38",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTY5/"},
{cat:"finance",title:"Offer 39",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTMy/"},
{cat:"finance",title:"Offer 40",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTI2/"},
{cat:"finance",title:"Offer 41",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTEx/"},
{cat:"finance",title:"Offer 42",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMTA5/"},
{cat:"finance",title:"Offer 43",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMDg4/"},
{cat:"finance",title:"Offer 44",link:"https://track.vcommission.com/t/MTI1NTYwXzEwMDgx/"}

];

const container = document.getElementById("offersContainer");

function displayOffers(category){
  container.innerHTML="";
  offers.forEach(o=>{
    if(category==="all" || o.cat===category){
      const card=document.createElement("div");
      card.className="card";
      card.innerHTML=`
        <span class="badge">HOT</span>
        <h3>${o.title}</h3>
        <a href="${o.link}" target="_blank">Earn Now →</a>
      `;
      container.appendChild(card);
    }
  });
}

function filterOffers(cat){
  document.querySelectorAll(".filters button").forEach(b=>b.classList.remove("active"));
  event.target.classList.add("active");
  displayOffers(cat);
}

displayOffers("all");
