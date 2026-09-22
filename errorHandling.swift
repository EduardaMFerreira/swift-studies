// Tratamento de erros em Swift
/* 
 Este arquivo demonstra como tratar erros em Swift usando enumerações que conformam o protocolo Error,
 a função que lança erros com 'throws', e o bloco 'do-catch' para capturar e lidar com esses erros.

 Para realizar as construção, precisamos de 3 etapas:
 1. Definir os erros possíveis usando uma enumeração que conforma o protocolo Error.
    - Informar o Swift sobre os possíveis erros que podem ocorrer.
 2. Criar uma função que lança erros usando 'throws'.
    - Escrever uma função que possa sinalizar erros caso eles ocorram.
 3. Utilizar o bloco 'do-catch' para capturar e lidar com os erros.
    - Chamar essa função e tratar quaisquer erros que possam ocorrer.
*/

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
    print("Senha muito curta!")
} catch PasswordError.obvious {
    print("Senha muito óbvia!")
} catch {
    print("Ocorreu um erro!") //mensagem generiaca configurada da apple
}

/* Ou podemos representar a função que lança erro da seguinte forma: 

let result = try! checkPassword(string)
print("Senha retorna: \(result)")

mas nao é indicado pq aqui você não trataria o erro e aqui daria errado pois nossa entrada é 1234
E o indicado é utilizar o bloco do 'do' e do 'catch'. Bloco catch é responsavel por lidar com todos tipos de erros.
*/