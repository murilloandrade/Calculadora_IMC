<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exemplo JSP (Java Server Pages) - Maior Menor</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>
  <body>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="panel-heading">
              <h3 class="panel-title">De menor ou De maior?</h3>
            </div>
            <div class="panel-body">
            <form>
                <fieldset>
                    <div class="form-group">
                        <div class="sexo">
                            <label>Sexo</label>
                            <div class="input">
                                    <input type="radio" id="radio-masculino" name="sexo" value="Masculino" checked/>
                                    <label for="radio-masculino">Masculino</label>
                                    <input type="radio" id="radio-feminino" name="sexo" value="Feminino" />
                                    <label for="radio-feminino">Feminino</label>
                            </div>
                        </div>

                        <div class="idade"> 
                            <label>Idade</label>
                            <div class="input">
                                <input class="form-control" placeholder="Idade" name="idade" type="text">
                            </div>
                        </div>

                        <div class="altura"> 
                            <label>Altura</label>
                            <div class="input">
                                <input class="form-control" placeholder="Altura" name="altura" type="text">
                            </div>
                        </div>

                        <div class="peso"> 
                            <label>Peso</label>
                            <div class="input">
                                <input class="form-control" placeholder="Peso" name="peso" type="text">
                            </div>
                        </div>

                        <div class="atividade-fisica">
                            <label>Atividade Física</label>
                            <div class="input">
                                    <input type="radio" id="radio-sedentaria" name="atividade" value="sedentaria" checked/>
                                    <label for="radio-sedentaria">Sedentária</label>
                                    <input type="radio" id="radio-moderada" name="atividade" value="moderada" />
                                    <label for="radio-moderada">Moderada</label>
                                    <input type="radio" id="radio-intensa" name="atividade" value="intensa" />
                                    <label for="radio-intensa">Intensa</label>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-success">Calcular</a>
                </fieldset>
            </form>
        </div>
    </div>
    <!-- Scriptlet. Codigo Java no HTML. -->
    <%
      String idadeStr = request.getParameter("idade");
      if (idadeStr != null) {
         int idade = Integer.parseInt(idadeStr);
    %>
    <br>
    <%
        if (idade >= 18) {
    %>
    <p>
      De maior! :)
    </p>
    <% 
        } else {
    %>
    <p>
      De menor! :)
    </p>
    <%
        }
      }
    %>
  </body>
</html>