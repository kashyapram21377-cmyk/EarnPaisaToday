const offers = [

/* ================= FINANCE ================= */

{cat:"finance",title:"Finance Offer 1",hot:true,link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDQ3/"},
{cat:"finance",title:"Finance Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDQ2/"},
{cat:"finance",title:"Finance Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDQ0/"},
{cat:"finance",title:"Finance Offer 4",link:"https://track.vcommission.com/t/MTI1NTYwXzEzMDMw/"},
{cat:"finance",title:"Finance Offer 5",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTkz/"},
{cat:"finance",title:"Finance Offer 6",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTc5/"},
{cat:"finance",title:"Finance Offer 7",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTU3/"},
{cat:"finance",title:"Finance Offer 8",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTM5/"},
{cat:"finance",title:"Finance Offer 9",link:"https://track.vcommission.com/t/MTI1NTYwXzEyOTAx/"},

/* ================= ECOMMERCE ================= */

{cat:"ecommerce",title:"Ecommerce Offer 1",hot:true,link:"https://track.vcommission.com/t/MTI1NTYwXzEyODU5/"},
{cat:"ecommerce",title:"Ecommerce Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzEyODM5/"},
{cat:"ecommerce",title:"Ecommerce Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzEyODI1/"},
{cat:"ecommerce",title:"Ecommerce Offer 4",link:"https://track.vcommission.com/t/MTI1NTYwXzEyNzY1/"},
{cat:"ecommerce",title:"Ecommerce Offer 5",link:"https://track.vcommission.com/t/MTI1NTYwXzEyNjcy/"},

/* ================= TRAVEL ================= */

{cat:"travel",title:"Travel Offer 1",hot:true,link:"https://track.vcommission.com/t/MTI1NTYwXzEzMTE2/"},
{cat:"travel",title:"Travel Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzEyMzcy/"},
{cat:"travel",title:"Travel Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzEyMTQ0/"},

/* ================= INSURANCE ================= */

{cat:"insurance",title:"Insurance Offer 1",hot:true,link:"https://track.vcommission.com/t/MTI1NTYwXzEyMTMx/"},
{cat:"insurance",title:"Insurance Offer 2",link:"https://track.vcommission.com/t/MTI1NTYwXzExODc1/"},
{cat:"insurance",title:"Insurance Offer 3",link:"https://track.vcommission.com/t/MTI1NTYwXzExODc0/"},

];

/* ================= UI ENGINE ================= */

const container = document.getElementById("offersContainer");

/* DISPLAY */
function displayOffers(category,searchTerm=""){

  container.innerHTML="";

  const filtered = offers.filter(o=>{
    const matchCat = category==="all" || o.cat===category;
    const matchSearch = o.title.toLowerCase().includes(searchTerm.toLowerCase());
    return matchCat && matchSearch;
  });

  if(filtered.length===0){
    container.innerHTML="<p style='text-align:center;width:100%'>No offers found</p>";
    return;
  }

  filtered.forEach((o,index)=>{

    const card=document.createElement("div");
    card.className="card";
    card.style.animation="fadeIn .5s ease forwards";

    const badgeColor = {
      finance:"#4caf50",
      ecommerce:"#ff5722",
      travel:"#2196f3",
      insurance:"#9c27b0"
    }[o.cat] || "#ff5722";

    card.innerHTML=`
      ${o.hot?'<div class="ribbon">HOT</div>':''}
      <span class="badge" style="background:${badgeColor}">
        ${o.cat.toUpperCase()}
      </span>
      <h3>${o.title}</h3>
      <a href="${o.link}" target="_blank" onclick="trackClick('${o.title}')">
        Earn Now →
      </a>
    `;

    container.appendChild(card);
  });

  updateCounts();
}

/* FILTER */
function filterOffers(cat,btn){

  document.querySelectorAll(".filters button")
  .forEach(b=>b.classList.remove("active"));

  if(btn) btn.classList.add("active");

  displayOffers(cat);
}

/* SEARCH */
function searchOffers(){
  const val = document.getElementById("searchBox").value;
  const activeBtn=document.querySelector(".filters button.active");
  const currentCat=activeBtn?activeBtn.dataset.cat:"all";
  displayOffers(currentCat,val);
}

/* COUNT BADGE */
function updateCounts(){
  document.querySelectorAll(".filters button").forEach(btn=>{
    const cat = btn.dataset.cat;
    if(!cat) return;
    const count = cat==="all" ? offers.length :
      offers.filter(o=>o.cat===cat).length;

    btn.innerHTML = btn.textContent.split("(")[0] + ` (${count})`;
  });
}

/* TRACK CLICK (future ready) */
function trackClick(title){
  console.log("Offer clicked:",title);
  // Firebase click tracking can be added here
}

/* INIT */
displayOffers("all");
updateCounts();
