<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat;" %>
<html>
    <head>
    <title>Calculadora de IMC</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="panel-heading">
                <h3 class="panel-title">Calculadora de IMC</h3>
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
      DecimalFormat df = new DecimalFormat("0.0");
      String idadeStr = request.getParameter("idade");
      String pesoStr = request.getParameter("peso");
      String alturaStr = request.getParameter("altura");
      String sexo = request.getParameter("sexo");
      String atividadeFisica = request.getParameter("atividade");
      if (idadeStr != null && pesoStr != null && alturaStr != null && sexo != null && atividadeFisica != null) {
         int idade = Integer.parseInt(idadeStr);
         int peso = Integer.parseInt(pesoStr);
         float altura = Float.parseFloat(alturaStr);
         float imc = peso / (altura * altura);
    %>
    <br>
    <%
        if (imc < 14.5) {
    %>
    <p>
      :( Seu IMC é <%= df.format(imc) %>. Isso indica que você está abaixo do peso ideal. É recomendado iniciar uma dieta focada em ganho de peso.
    </p>
    <% 
        } else 
        if (imc < 18.2) {
    %>
    <p>
      :) Seu IMC é <%= df.format(imc) %>. Isso indica que você está no peso ideal para a sua altura! Mas é sempre bom manter-se cuidadoso com a sua saúde, então não deixe de ter uma dieta equilibrada e nutritiva!
    </p>
    <% 
        } else 
        if (imc < 19.6) {
    %>
    <p>
      :o Seu IMC é <%= df.format(imc) %>. Isso indica que você pode estar com sobrepeso. É recomendado que você seja mais atencioso com o valor calórico da sua dieta e inicie algum tipo de exercício físico. 
    </p>
    <% 
        } else
        if (imc >= 19.6 && atividadeFisica != "intensa") {
    %>
    <p>
      :( Seu IMC é <%= imc %>. Isso indica que você pode estar com obesidade. É recomendado que você inicie uma dieta de perda de peso e inicie uma rotina mais ativa com bastante exercícios físicos.
    </p>
    <% 
        } else
    %>
    <p>
      :o Seu IMC é <%= imc %>. Isso indica que você pode estar com obesidade, mas como você pratica muita atividade física, o seu peso pode ser devido aos músculos, o que é uma coisa boa. Para confirmar isso, o ideal é que você procure o nutricionista ou o médico para avaliar sua composição corporal.
    </p>
    <%
        }
      }
    %>
  </body>
</html>