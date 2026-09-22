// Tratamento de erros em Swift

enum PasswordError: Error {
    case short, obvious
}


func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string) 
    // Excutada com sucesso, ela retorna o valor direto para o 'result' e continuará executando a próxima, no caso o 'print';
    // Mas se algum erro for gerado, todo bloco do 'do' termina e ele pula direto para o bloco 'catch' passando para o print: Ocorreu um erro;
    print("Senha retorna: \(result)")
} catch PasswordError.short {
    print("Crie uma senha com mais de 5 caracteres!")
} catch PasswordError.obvious {
    print("Crie uma senha que não tenha números seguidos!")
} catch {
    print("Ocorreu um erro!") //mensagem generiaca configurada da apple
}

/* Ou podemos representar a função que lança erro da seguinte forma: 

let result = try! checkPassword(string)
print("Senha retorna: \(result)")

mas nao é indicado pq aqui você não trataria o erro e aqui daria errado pois nossa entrada é 1234
E o indicado é utilizar o bloco do 'do' e do 'catch'. Bloco catch é responsavel por lidar com todos tipos de erros.
*/