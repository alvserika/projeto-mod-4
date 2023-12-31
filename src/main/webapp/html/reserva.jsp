<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserva</title>
<link rel="stylesheet" href="../styles/style.css">
<link rel="stylesheet" href="../styles/home.css">
<link rel="stylesheet" href="../styles/medias.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">
<link rel="shortcut icon" href="../assets/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body class="min-vh-100 d-flex flex-column justify-content-between">
<header class="container-fluid bg-white">

    </header>
	<main class="container">
	<div id="select">
	
	</div>		
		
		<!-- Button trigger modal -->
		
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#cadastroModal">Cadastrar reserva</button>

		<!--incio Modal -->

		<div class="modal fade" id="cadastroModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Cadastro</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<!-- body modal -->
					<div class="modal-body">
						<form action="/tde/reserva-save">
							<div class="form-group mb-2 ">
								<label for="idUsuario">Id do Usuario</label> 
								<select id="idUsuario" name="idUsuario">
									<c:forEach items="${usuarios}" var="u">
									<option value="${u.idUsuario}">
										${u.nome}
									</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group mb-2 ">
								<label for="idDestino">Id do Destino</label> 
								<select id="idDestino" name="idDestino">
									<c:forEach items="${destinos}" var="d">
									<option value="${d.idDestino}">
										${d.nomeDestino}
									</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group mb-2 ">
								<label for="idPacote">Id do Pacote</label> 
								<select id="idPacote" name="idPacote">
									<c:forEach items="${pacotes}" var="p">
									<option value="${p.idPacote}">
										${p.idPacote}
									</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group mb-2 ">
								<label for="dtCheckin">Data do check in</label> <input type="text" id="dtCheckin"
									name="dtCheckin" class="form-control">
							</div>
							<div class="form-group mb-2 ">
								<label for="dtCheckout">Data do check out</label> <input type="text" id="dtCheckout"
									name="dtCheckout" class="form-control">
							</div>
							<div class="form-group mb-2 ">
								<label for="statusReserva">Status da reserva</label> <input type="text" id="statusReserva"
									name="statusReserva" class="form-control">
							</div>
							

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-primary">Save</button>
							</div>


						</form>

					</div>


				</div>
			</div>
		</div>
		<!--  !fim do modal -->



<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID da reserva</th>
						<th scope="col">ID do usuario</th>
						<th scope="col">ID do destino</th>
						<th scope="col">Avaliação</th>
						<th scope="col">ID do pacote</th>
						<th scope="col">Data do checkin</th>
						<th scope="col">Data do check Out</th>
						<th scope="col">Status da reserva</th>
						<th scope="col">Ações</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reservas}" var="r">
						<tr>
							<th scope="row">${r.idReserva}</th>
							<td>${r.usuario.nome}</td>
							<td>${r.destinos.nomeDestino}</td>
							<td>${r.destinos.avaliacao}</td>
							<td>${r.pacotes.idPacote}</td>
							<td>${r.dtCheckIn}</td>
							<td>${r.dtCheckout}</td>
							<td>${r.statusReserva}</td>
							<td><a href="#" class="btn btn-warning"
								data-bs-toggle="modal"
								data-bs-target="#atualizarModal${r.idReserva}">Editar</a>

								<button class="btn btn-danger" data-bs-toggle="modal"
									data-bs-target="#excluirModal${r.idReserva }">Excluir</button></td>
						</tr>
						<div class="modal fade" id="excluirModal${r.idReserva }"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Deseja excluir?</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<a href="/tde/reserva-delete?id=${r.idReserva}"
											class="btn btn-danger">Excluir</a>
									</div>
								</div>
							</div>
						</div>

						<!--incio Modal -->

						<div class="modal fade" id="atualizarModal${r.idReserva}"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Cadastro</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>

									<!-- body modal -->
									<div class="modal-body">

										<form action="/tde/reserva-save">
											<input type="text" id="idReserva" name="idReserva"
												class="form-control" value="${r.idReserva}" hidden>
											<div class="form-group mb-2 ">
								<label for="idUsuario">Id do Usuario</label> 
								<select id="idUsuario" name="idUsuario">
									<c:forEach items="${usuarios}" var="u">
									<option value="${u.idUsuario}">
										${u.nome}
									</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group mb-2 ">
								<label for="idDestino">Id do Destino</label> 
								<select id="idDestino" name="idDestino">
									<c:forEach items="${destinos}" var="d">
									<option value="${d.idDestino}">
										${d.nomeDestino}
									</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group mb-2 ">
								<label for="idPacote">Id do Pacote</label> 
								<select id="idPacote" name="idPacote">
									<c:forEach items="${pacotes}" var="p">
									<option value="${p.idPacote}">
										${p.idPacote}
									</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group mb-2 ">
								<label for="dtCheckin">Data do check in</label> <input type="text" id="dtCheckin"
									name="dtCheckin" class="form-control">
							</div>
							<div class="form-group mb-2 ">
								<label for="dtCheckout">Data do check out</label> <input type="text" id="dtCheckout"
									name="dtCheckout" class="form-control">
							</div>
							<div class="form-group mb-2 ">
								<label for="statusReserva">Status da reserva</label> <input type="text" id="statusReserva"
									name="statusReserva" class="form-control">
							</div>
							

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!--  fim modal -->


					</c:forEach>
				</tbody>
			</table>
			</div>
	</main>
	<footer class="ft-cntt">
  	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script type="module" src="../js/listas.js"></script>
</body>
</html>