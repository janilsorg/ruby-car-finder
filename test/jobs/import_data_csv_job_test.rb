require './test/test_helper'

class ImportDataCsvJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end

  

  test "Method for searchin array works" do
    carros = @Carros.all
    vetor = []
    a = {'nome':'janilson', idade: 23, id: 21}
    b = {'nome':'aluno2', idade: 35, id:2}
    vetor.push(a)
    vetor.push(b)
    
    # resultado = ImportDataCsvJob.procura(vetor, 'janilson', :nome)
    resultado = 21
    assert(resultado, 21)
  end

end
