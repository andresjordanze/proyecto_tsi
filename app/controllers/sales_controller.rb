class SalesController < ApplicationController

  def index
    @sales = Sale.all   
  end

  def show
    @sale = Sale.find(params[:id])
    if params[:name] == nil
      @subproducts = Subproduct.paginate(:per_page => 5, :page => params[:page])
    else
      #@subproducts = Subproduct.where({name: "#{params[:name]}"}).paginate(:per_page => 5, :page => params[:page])
      @subproducts = Subproduct.where("name like ?", "%#{params[:name]}%").paginate(:per_page => 5, :page => params[:page])
    end
  end

  def egresos
    @sales = Sale.all
    @subproducts = Subproduct.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new
    @sale.price =  params[:price]
    @sale.confirmed =  params[:confirmed]
    @sale.check_number =  params[:check_number]
    @sale.client_name =  params[:client_name]
    @sale.nit =  params[:nit]
    if @sale.save   
      redirect_to @sale
    else
      flash[:message] = "Verifique los Campos Marcados"
      render :action => 'new'
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

def update
		@sale = Sale.find(params[:id])
    @sale.client_name = Client.where("nit = :nit", {nit: params[:sale][:nit]}).to_a.at(0).name
    if @sale.update_attributes(params[:sale])
      flash[:success] = "Venta Confirmada"
      redirect_to @sale
    else
      render 'edit'
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @productsales = Productsale.all
    @productsales.each do |subproducto|
      if subproducto.sale_id == @sale.id
        subproducto.sale_id = nil
        subproducto.available = true
        subproducto.save
      end
    end
    @sale.destroy
    flash[:notice] = "Venta Cancelada"
    redirect_to sales_url
  end

  def confirm_sale
    @sale = Sale.find(params[:identificator])
    @sale.confirmed = true
    @outflow = Outflow.new
    @outflow.registrar(params[:identificator])
    @sale.save
    render 'edit'
    flash[:success] = "Venta Realizada..."
  end

  def cancel_sale
    @sale = Sale.find(params[:id])
    @subproducts = Subproduct.all
    @subproducts.each do |subproducto|
      if subproducto.sale_id == @sale.id
        subproducto.sale_id = nil
        subproducto.available = true
        subproducto.save
      end
    end
    @sale.destroy
    flash[:notice] = "Venta Cancelada"
    redirect_to sales_url
  end

  def destroyer
    @sale = Sale.find(params[:deletor])
    @sale.destroy
    flash[:notice] = "Venta Cancelada"
    redirect_to sales_url
  end

  def search
    @sales = buscar(params[:name])
    render 'index'
  end

  def buscar(nombre)
      items = Array.new 
      aux = Sale.all
      if nombre != "" && nombre != nil
          aux.each do |item|
          if (item.correspondeACliente(nombre))
              items.push(item)
          end
        end
      else
          items = aux
      end
      return items
    end

    def searchProduct
      @sales = buscarProd(params[:producto])
      render 'index'
    end

    def buscarProd(nombre)
      items = Array.new 
      aux = Sale.all
      if nombre != "" && nombre != nil
          aux.each do |item|
          if (item.tieneAlProducto(nombre))
              items.push(item)
          end
        end
      else
          items = aux
      end
      return items
    end

    def report
      #@sales = filter_by_date(Date.today)
      #@total = obtain_total(@sales)
      #render 'print'
    end

    def searchDate
      selected_date = Date.parse(params[:date])
      @sales = Sale.where(:created_at => selected_date.beginning_of_day..selected_date.end_of_day)
      render 'index'
    end

    def report_search
    end

    def search_between_dates
      initial_date = Date.parse(params[:initial_date])
      ending_date = Date.parse(params[:ending_date])
      @sales = Sale.where(:created_at => initial_date.beginning_of_day..ending_date.end_of_day)
      @total = obtain_total(@sales)
      render 'report'
    end

    def daily_report
      @sales = filter_by_date(Time.now)
      @total = obtain_total(@sales)
    render 'report'
    end

    def weekly_report
      @sales = week
      @total = obtain_total(@sales)
    render 'report'
    end

    def monthly_report
      @sales = month
      @total = obtain_total(@sales)
    render 'report'
    end

    def anual_report
      @sales = year
      @total = obtain_total(@sales)
      render 'report'
    end

    def year
      items = Array.new
      aux = Sale.all
      items = aux.where("created_at > ? AND created_at < ?", Date.today.beginning_of_year, Date.today.end_of_year)
      return items
    end

    def month
      items = Array.new
      aux = Sale.all
      items = aux.where("created_at > ?", DateTime.now.beginning_of_month)
      return items
    end

    def week
      items = Array.new
      aux = Sale.all
      items = aux.where(["created_at >= ?", 7.days.ago])
      return items
    end

    def filter_by_date(date)
      items = Array.new
      aux = Sale.all
      items = aux.where(["created_at >= ? AND created_at <= ?", date.beginning_of_day, date.end_of_day])
      return items
    end

    def obtain_total(sales)
      aux = 0
      sales.each do |sale|
        aux = aux + sale.price
      end
      return aux
    end

end
