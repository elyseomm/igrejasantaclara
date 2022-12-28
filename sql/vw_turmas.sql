SELECT 
        t.id AS id,
        t.nome AS turma,
        t.sala AS sala,
        c.nome AS catequista,
        a.nome AS aluno,
        r.nome responsavel
    FROM turmas_ivc t
        LEFT JOIN turma_alunos_ivc ta ON (ta.idturma = t.id)
        LEFT JOIN alunos_ivc a ON (a.id = ta.idaluno)
        LEFT JOIN catequistas c ON (c.id = t.idcatequista)
        LEFT JOIN responsaveis_ivc r ON (r.id = a.idresponsavel)