class UsersController < ApplicationController
  def login_form
  end

  def show

    @shop_id = @current_user.id
    puts "【@shop_id】" + @shop_id.to_s
    @shop = @current_user.shops.find(@shop_id)

    @keywords = @shop.keywords

    @keywords.each do |keyword|
      puts keyword.url
      agent = Mechanize.new
      agent.user_agent_alias = "Mac Safari"
      page = agent.get(keyword.url)
      @elements = page.search('.dbg0pd')
      @ads = page.search('.gghBu')
      puts "【@adsの要素数】" + @ads.length.to_s
      rank = 0
      for element in @elements
        rank += 1
        puts element.inner_text
        check = element.inner_text.include?(@shop.shopname)
        if check
          puts("Match!")
          puts "【順位】" + (rank - @ads.length).to_s
        end
      end

    end

  end

  def login
    @user = User.find_by(email: params[:@user][:email], password: params[:@user][:password])
    if @user
      session[:user_id] = @user.id
      # flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}", success: 'ログインに成功しました')

    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      flash.now[:danger] = "ログインに失敗しました"
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

end
