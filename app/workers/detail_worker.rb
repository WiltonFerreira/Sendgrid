class DetailWorker
  include Sidekiq::Worker

  def perform(cliente, evento)
    # Job de processamento assincrono para gravacao das informações coletadas.
    @registro = Sent.new(account: cliente, info: evento, active: true)
    @registro.save

    #recupera conta cadastrada
    @account = Account.find_by(name: cliente, active: true)

    #Validacoes
    if (@account)
      puts "Sent: #{@registro['id'].to_s} - " + @account[:id].to_s
      #Processamento da stream
      detalhamento(@registro['id'],@account['id'])
    end
        
  end

  def detalhamento(entrada, account)
    #Preenche vetor com colunas
    columns = Event.columns_hash
    
    # Busca entrada gravada em disco
    @evento = Sent.find(entrada)
    puts "  Evento:#{@evento['id']} Conta:#{@evento['account']} - Info:#{@evento['info']}"

    #Modelo do hash para gravacao
    novo = {
      "account_id" => account,
      "sent_id" => entrada,
      "event_post_timestamp" => Time.now.to_i
    }

    @ins = JSON.parse @evento['info'].gsub('=>',':')
    @ins.each do |k,v|
      if k=="type" then
        novo["type_id"] = v
      elsif columns[k] then
        novo[k] = v
      end
    
       #puts "  #key: #{k} - #value: #{v}" 
    end
    puts "  =>novo:" + novo.inspect
    @detalhe=Event.new(novo)
    if @detalhe.save then
      puts "   =>detalhe:#{@detalhe['id'].to_s}"
    else
      puts "   =>ERRO:#{@detalhe.errors.inspect}"
    end
  end

end
