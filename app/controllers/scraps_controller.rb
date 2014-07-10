class ScrapsController < ApplicationController
  before_action :set_scrap, only: [:show, :edit, :update, :destroy]

  # GET /scraps
  # GET /scraps.json
  def index
    @scraps = Scrap.all
  end

  # GET /scraps/1
  # GET /scraps/1.json
  def show
  end

  # GET /scraps/new
  def new
    @scrap = Scrap.new
  end

  # GET /scraps/1/edit
  def edit
  end

  # POST /scraps
  # POST /scraps.json
  def create
    @scrap = Scrap.new(params[:scrap])



  require 'scrapifier'
  require 'nokogiri'
  require 'open-uri'
  require 'addressable/uri'
  require 'mechanize'
  require 'pattern-match'
  require 'rubygems'
     

 r = @url
 
 case r
     when /http?:\/\/www.gizmobaba.com[\S]+/
	page = Nokogiri::HTML(open(url,'User-Agent'=>'Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1')) 
   	#@url = r
	@title = page.xpath("//div[@class='ctl_aboutbrand']/h1").text
 	@desc =  page.xpath("//p[@itemprop='description']").text
   	@price = page.xpath("//span[@itemprop='price']").text
   	@img = page.xpath("////img[@id='bankImage']/@src")

    when /http?:\/\/www.myntra.com[\S]+/
	page = Nokogiri::HTML(open(url,'User-Agent'=>'Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1'))
   	#@url = r
	@title = page.xpath("//h1[@class='title']").text
  	@desc =  page.xpath("//div[@class='description']/p").text
   	@price = page.xpath("//div[@class='price']").text
    	@img = page.xpath("//div[@class='blowup']/img/@src")

    else
        agent = Mechanize.new
	data = r.scrapify(images: [:jpg] )
	@url =  data[:uri]
	@title = data[:title]
	@desc = data[:description]  
	case r
		when /http?:\/\/www.jabong.com[\S]+/
       		code = agent.get(r)
	        @price = code.at("//span[@itemprop='price']")  
       	        @image = code.at("//img[@itemprop ='image']/@src")

		when /http?:\/\/www.flipkart.com[\S]+/
	        code = agent.get(r)
       		@price = code.at("//span[@class='fk-font-verybig pprice vmiddle fk-bold']")
       		@image = code.at("//img[@id ='visible-image-small']/@src")
   
   		when /http?:\/\/www.99lens.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='price']")
	        @image = code.at("//img[@id ='image']/@src")	

		when /http?:\/\/www.amazon.in[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@id='priceblock_ourprice']")
		@image = code.at("//img[@id ='landingImage']/@src")

		when /http?:\/\/www.americanswan.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='product-price-12782']")
		@image = code.at("//img[@id ='image']/@src")

		when /http?:\/\/www.babyoye.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='current_product_price']")
		@image = code.at("//img[@class ='google-analytics-event']/@src")

		when /http?:\/\/www.basicslife.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='price']")
		@image = code.at("//a[@class='MagicZoomPlus']/img/@src")

		when /http?:\/\/www.bhaap.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='price']")
		@image = code.at("//div[@class='product-img-box']/a/img/@src")

		when /http?:\/\/www.coke2home.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//p[@class='online_price29']")
		@image = code.at("//a[@class='jqzoom2']/@href")

		when /http?:\/\/crazyflorist.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='regular-price']")
        	@image = code.at("//img[@itemprop='image']/@src")

		when /http?:\/\/www.dailyobjects.com[\S]+/	
		code = agent.get(r)
        	@price = code.at("//div[@class='do_detail_page_product_price']")
		@image = code.at("//img[@itemprop='image']/@src")

  		when /http?:\/\/www.fashionara.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@itemprop='lowprice']")
		@image = code.at("//img[@itemprop='image']/@src")

		when /http?:\/\/www.fnp.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@id='INR']")
		@image = code.at("//div[@class='slider']/ul/li/img/@src")

		when /http?:\/\/www.freecultr.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@id='product-price-14473']")
		@image = code.at("//img[@id='zoom1']/@src")

		when /http?:\/\/www.gizmobaba.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='offer']")
		@image =  code.at("//img[@id='bankImage']/@src")

		when /http?:\/\/www.grabmore.in[\S]+/
		code = agent.get(r)
	        @price = code.at("//div[@class='appr_price']")
		@image = code.at("//img[@id='zoom1']/@src")

		when /http?:\/\/www.haladirams.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='price']")
		@image = code.at("//img[@id='zoom_Img']/@src")
	
		when /http?:\/\/www.healthgenie.in[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@id='product-price-8924']")
		@image = code.at("//img[@id='image1']/@src")

		when /http?:\/\/www.high5store.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@id='our_price_display']")
		@image = code.at("//img[@id='bigpic']/@src")

		when /http?:\/\/www.indireads.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//p[@class='price']")
		@image =  code.at("//img[@class='attachment-shop_single wp-post-image']/@src")

		when /http?:\/\/www.kidzdeals.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='price']")
		@image = code.at("//p[@class='product-image product-image-zoom']/a/img/@src")

		when /http?:\/\/www.metroshoes.net[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@itemprop='price']")
		@image = code.at("//img[@id='bankImage']/@src")


		when /http?:\/\/www.pannkh.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='mrp']")
		@image =  code.at("//img[@id='largeImage']/@src")

		when /http?:\/\/www.pepperfry.com[\S]+/
 		code = agent.get(r)
	        @price = code.at("//li[@class='you_pay_price']")
		@image = code.at("//img[@id='zoom_01']/@src")

		when /http?:\/\/www.planetsportsonline.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='offer']")
		@image = code.at("//img[@id='bankImage']/@src")

		when /http?:\/\/www.purplle.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@class='normal-price d-b']")
		@image = code.at("//img[@class='product-img']/@src")

		when /http?:\/\/www.shopatplaces.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//div[@class='price']")
		@image = code.at("//img[@id='image']/@src")


		when /http?:\/\/www.slassy.com[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@itemprop='price']")
		@image = code.at("//a[@class='productzoom']/@href")

		when /http?:\/\/www.smiledrive.in[\S]+/
		code = agent.get(r)
	        @price = code.at("//span[@id='product-price-77']")
		@image = code.at("//a[@id='zoom1']/img/@src")

		when /http?:\/\/www.stalkbuylove.com[\S]+/
		code = agent.get(r)
        	@price = code.at("//span[@class='price']")
		@image = code.at("//img[@class='my_image_box']/@src")

		when /http?:\/\/www.yebhi.com[\S]+/
		code = agent.get(r)
        	@price = code.at("//span[@itemprop='price']")
        	@image = code.at("//img[@itemprop='image']/@src")

		when /http?:\/\/www.yepme.com[\S]+/
		code = agent.get(r)
        	@price = code.at("//span[@id='lblPayHead']")
		@image = code.at("//img[@id='img2']/@src")

		when /http?:\/\/www.zovi.com[\S]+/
		code = agent.get(r)
       		@price = code.at("//label[@id='price']")
		@image = code.at("//section[@id='detail-image']/img/@src")

		when /http?:\/\/www.fabally.com[\S]+/
		code = agent.get(r)
		@price = code.at("//div[@class='codeArea']/span")
		@image = code.at("//img[@id='prdimage']/@src")

		when /http?:\/\/www.beebayonline.com[\S]+/
 		code = agent.get(r)
		@price = code.at("//span[@class='price']")
		@image = code.at("//p[@class='product-image product-image-zoom']/a/@href")

		when /http?:\/\/www.foodpanda.in[\S]+/ 
 		code = agent.get(r)
		@price = code.at("//div[@class='restaurant-list-table last']")
		@image = code.at("//div[@class='restaurant-content clearfix']/img/@src")

		when /http?:\/\/www.jewelskart.com[\S]+/ 
 		code = agent.get(r)
		@price = code.at("div[@class='lenskart']")
		@image = code.at("//div[@id='slide-img']/a/img/@src")

		when /http?:\/\/www.lenskart.com[\S]+/ 
 		code = agent.get(r)
		@price =  code.at("div[@class='lenskart']")
		@image =  code.at("//div[@id='slide-img']/a/img/@src")

		when /http?:\/\/www.moodsofcloe.com[\S]+/ 
		code = agent.get(r)
		@price = code.at("//p[@class='productPrice color']")
		@image = code.at("//div[@class='zImg om']/a/@href")

		when /http?:\/\/www.watchkart.com[\S]+/ 
 		code = agent.get(r)
		@price = code.at("div[@class='lenskart']")
		@image = code.at("//div[@id='slide-img']/a/img/@src")

		when /http?:\/\/www.clapone.com[\S]+/
  		code = agent.get(r)
		@price = code.at("//div[@class='price']")
		@image = code.at("//img[@id='image']/@src")

		when /http?:\/\/www.fabfurnish.com[\S]+/
 		code = agent.get(r)
        	@price = code.at("//span[@class='special_price_box']")
		#@image = 

		when /http?:\/\/www.fashionequation.com[\S]+/
		code = agent.get(r)
        	@price = code.at("//span[@class='money']")
		#@image = 

		when /http?:\/\/www.shopclues.com[\S]+/
 		code = agent.get(r)
        	@price = code.at("//span[@id='sec_discounted_price_2631066']")
		#@image = 

		when /http?:\/\/www.miladyavenue.com[\S]+/
 		code = agent.get(r)
        	@price = code.at("//span[@class='price-new']")
		#@image = 

		when /http?:\/\/www.limeroad.com[\S]+/
 		code = agent.get(r)
       		#@price = code.at("//span[@class='price']")
		#@image = 
		
		else
		 puts " waiting for authentication to publish"
	

    end

 end
  
 
@scrap.save 


    respond_to do |format|
      if @scrap.save
        format.html { redirect_to @scrap, notice: 'Scrap was successfully created.' }
        format.json { render :show, status: :created, location: @scrap }
      else
        format.html { render :new }
        format.json { render json: @scrap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraps/1
  # PATCH/PUT /scraps/1.json
  def update
    respond_to do |format|
      if @scrap.update(scrap_params)
        format.html { redirect_to @scrap, notice: 'Scrap was successfully updated.' }
        format.json { render :show, status: :ok, location: @scrap }
      else
        format.html { render :edit }
        format.json { render json: @scrap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraps/1
  # DELETE /scraps/1.json
  def destroy
    @scrap.destroy
    respond_to do |format|
      format.html { redirect_to scraps_url, notice: 'Scrap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrap
      @scrap = Scrap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrap_params
      params.require(:scrap).permit(:url, :title, :desc, :image, :price)
    end
end
