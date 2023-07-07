<template>
  <div class="head">
    <h1>Who's your Guy?</h1>
    <p>
      We are The TV Guys, your go-to destination for all your TV needs in Nairobi Kenya and its environs. We specialize in delivering exceptional TV solutions. We offer a specially curated selection of the latest TVs at unbeatable prices, delivery, mounting and repair services at the comfort of your home. 
    </p>
  </div>
  <div class="statment">

    <div>
      <h2>Sales & Delivery</h2>
      <p>
        Commited to customer satisfaction, we offer a wide range of TVs at the lowest prices in town. Our curated selection includes the latest models with cutting-edge features as well as budget-friendly options, all without compromising on quality. Did we mention we Deliver to your doorstep?....Same Day
      </p>
    </div>

    <div>
      <h2>Installation</h2>
      <p>
        Our expert technicians are dedicated to providing seamless TV mounting services, ensuring a secure and professional installation that enhances your viewing experience. We take care of the entire process, from handling the heavy lifting to ensuring a visually appealing result, saving you time and effort.
      </p>
    </div>

    <div>
      <h2>Service & Repairs</h2>
      <p>
        In addition to our mounting services, we understand that technical issues can arise unexpectedly. That's why our skilled technicians offer on-site TV repair services. They will promptly diagnose and resolve any problems right at your home, minimizing downtime and inconvenience.
      </p>
    </div>
    
  </div>
  <div class="conclusion">
    <p>
      At The TV Guys, we pride ourselves on providing convenience, professionalism, and affordability. Trust us to transform your TV experience with our exceptional services and competitive prices. Contact us today to schedule your TV mounting, repair, or explore our wide range of affordable TVs. Choose The TV Guys and enjoy the best in TV solutions for Nairobi and its environs.  
    </p> 
  </div>
</template>

<script>
export default {

}
</script>

<style>
  .head {
    padding-block-start: 130px;
  }
  
  .head, .conclusion {
    text-align: center;
    max-width: 80vw;
    margin: auto;
  }

  .head p{
    padding-block-start: 20px;
    display: block;
    text-align: left;
  }
  .statment {
    text-align: center;
    display: flex;
    max-width: 80vw;
    padding: 20px;
    margin: auto;
  }

  @media screen and (max-width: 1080px) {
    .statment {
      flex-direction: column;
      align-items: center;
    }
    
  }

  .statment div {
    background-color: rgba(1, 7, 36, 0.788);
    color: white;
    width: 600px;    
    display: block;
    text-align: center;
    border: solid 1px;
    border-radius: 20px;
    padding: 20px;
    margin: 20px 20px;
    max-width: 80vw;
  }

  .conclusion{
    text-align: left;
  }
</style>

