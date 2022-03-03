extends Node

func randomQuestion() -> Dictionary:
    var question = _pickRandom(questions)
    return {
        "question": question["question"],
        "answers": _shuffleAnswers(question["correct_answer"], question["wrong_answers"]),
        "correct_answer": question["correct_answer"],
    }

func _pickRandom(array: Array):
    return array[randi() % array.size()]

func _shuffleAnswers(correct_answer: String, wrong_answers: Array) -> Array:
    var answers = wrong_answers.duplicate()
    answers.append(correct_answer)
    answers.shuffle()
    return answers

var questions = [
    {
        "level": 0,
        "question": "Kes sa oled?",
        "correct_answer": "Olen korp! Fraternitas Estica uus rebane.",
        "wrong_answers": [
            "Olen korp! Fraternicas Estica uus rebane.",
            "Olen korp! Faternitas Estika uus rebane.",
            "Olen korp! Faterlitas Estika uus rebane.",
        ],
    },
    {
        "level": 1,
        "question": "Kes on rebane?",
        "correct_answer": "Tegevkonvendi liige, kel vanust alla kahe semestri.",
        "wrong_answers": [
            "Konvendi kandideeriv liige kel pole värve.",
            "Konvendi liige, kel on raskusi sirkli joonistamisega.",
            "Punase kasukaga metsik kanavaras.",
        ],
    },
    {
        "level": 1,
        "question": "Kes on jänes?",
        "correct_answer": "Pikkade kõrvadega väikeuluk.",
        "wrong_answers": [
            "vil! Siili suurim sõber.",
            "Mitte-mensurandist kaasvõitlaja.",
            "Põhjuseta lahkunuks arvatud liige.",
        ],
    },
    {
        "level": 1,
        "question": "Kes on kaasvõitleja?",
        "correct_answer": "Tegevkonvendi värvikandja, kes käib ülikoolis ja on vanem kui rebane.",
        "wrong_answers": [
            "Korporatsiooni liige, kel on värvide kandmise õigus.",
            "Auvahekorra vastaspool (mitte kuramaator).",
            "Konvendi tegevliige.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on komitaat?",
        "correct_answer": "Äsja ülikooli lõpetanud fraaterite korraldatud pidu.",
        "wrong_answers": [
            "Fraateri matustele järgnev koosviibimine konvendis.",
            "Kohustuslik rebaste vehklemistund.",
            "Tervist taastav koosviibimine peale kommerssi või muud suuremat pidu.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on lakkimine?",
        "correct_answer": "Karistuseks määratud värvide kandmise keeld.",
        "wrong_answers": [
            "Eestseisuse liikmeks valimine.",
            "Rebasest noormajaks saamise rituaal.",
            "Akadeemilisele emale õllest kangema joogiga sisse andmine.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on stehhimine?",
        "correct_answer": "Rapiiriteraga tekli läbistamine vennastuspeol.",
        "wrong_answers": [
            "Karistus liikmemaksu tasumata jätmise eest.",
            "Karistuseks määratud värvide kandmise keeld.",
            "Vilistlaskokku vastuvõtmine.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on juhtsimine?",
        "correct_answer": "Karistus liikmemaksu tasumata jätmise eest.",
        "wrong_answers": [
            "Ühest kuni 99 aastaks konvendist välja arvamine.",
            "Rapiiriteraga tekli läbistamine vennastuspeol.",
            "Rebase põhjuseta lahkunuks lugemine.",
        ],
    },
    {
        "level": 1,
        "question": "Kes on ruktoonus?",
        "correct_answer": "Isik kellel on korporatsiooniga läbikäimine keelatud.",
        "wrong_answers": [
            "Korp! Ruktonia liige.",
            "Värske värvikandja.",
            "Värvide saamise üle otsustava koosoleku liige.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on rebaste raseerimise õigus?",
        "correct_answer": "Rebaste õigus vennastuse ajal veini pihta panna.",
        "wrong_answers": [
            "Vanamehe õigus rebasteid ebasobiliku soengu eest karistada.",
            "Õigus peale värvide saamist akadeemilisele emale sisse anda.",
            "Rebaste õigus õllelauas magama jäänud fraateril habe maha ajada.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on trisna?",
        "correct_answer": "Fraateri matustele järgnev koosviibimine konvendis.",
        "wrong_answers": [
            "Pidulik rongkäik volbri ja ülikooli aastapäeva ajal.",
            "Äsja ülikooli lõpetanud fraaterite korraldatud pidu.",
            "Korporatsioonist määramata ajaks välja heitmine.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on pluserdamine?",
        "correct_answer": "Konvendi vara tahtlik lõhkumine.",
        "wrong_answers": [
            "Karistus liikmemaksu tasumata jätmise eest.",
            "Con-coetorite ühine laulmine peale vennastuspidu.",
            "Metsikute külaliste konventi toomine.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on kaatripäev?",
        "correct_answer": "Tervist taastav koosviibimine peale kommerssi või muud suuremat pidu.",
        "wrong_answers": [
            "Fraateri matustele järgnev koosviibimine konvendis.",
            "Päev, mil konvendis on lubatud raha peale kaartide mängimine.",
            "Iga-aastane laevasõit emajõel.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on comment suspendu?",
        "correct_answer": "Ootele pandud auvahekord.",
        "wrong_answers": [
            "Alkoholi tarbimise keeld.",
            "Luba õllelauast lahkuda.",
            "Vaikimiskohustus.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on küüneproov?",
        "correct_answer": "Šoppeni tühjuse kontroll.",
        "wrong_answers": [
            "Kaasvõitlejate maniküüri ülevaatus.",
            "Rebasteatri proovietendus.",
            "Laua ettevalmistus enne kvarterimängu viset.",
        ],
    },
    {
        "level": 1,
        "question": "Mis on coetus-šlukk?",
        "correct_answer": "Con-coetorite ühine laulmine peale vennastuspidu.",
        "wrong_answers": [
            "Eriline jook, mida valmistatakse põleva piirituse ja laulu saatel.",
            "Tervele coetusele sisse andmine.",
            "Coetuse liikmete ühte hoidmise põhimõte.",
        ],
    },
    {
        "level": 2,
        "question": "Mitmendat semestrit käib noormaja?",
        "correct_answer": "3. ja 4. semestrit.",
        "wrong_answers": [
            "1. ja 2. semestrit.",
            "5. ja 6. semestrit.",
            "7. ja 8. semestrit.",
        ],
    },
    {
        "level": 2,
        "question": "Kuidas nimetatakse 6. semestrit liige olijat?",
        "correct_answer": "Vanamaja.",
        "wrong_answers": [
            "Väga-vanamaja.",
            "Noormaja.",
            "Sammalpea.",
        ],
    },
    {
        "level": 2,
        "question": "Kuidas nimetatakse 7. semestrit liige olijat.",
        "correct_answer": "Väga-vanamaja.",
        "wrong_answers": [
            "Vanamaja.",
            "Väga-sammalpea.",
            "Sammalpea.",
        ],
    },
    {
        "level": 2,
        "question": "Mitmendat semestrit käib sammalpea?",
        "correct_answer": "9. ja 10. semestrit.",
        "wrong_answers": [
            "7. ja 8. semestrit.",
            "5. ja 6. semestrit.",
            "3. ja 4. semestrit.",
        ],
    },
    {
        "level": 2,
        "question": "Kuidas nimetatakse 11. semestrit liige olijat.",
        "correct_answer": "Väga-sammalpea.",
        "wrong_answers": [
            "Sammalpea.",
            "Kuldrebane.",
            "Vanamees.",
        ],
    },
    {
        "level": 2,
        "question": "Kui vana on kuldrebane?",
        "correct_answer": "13 või rohkem semestrit.",
        "wrong_answers": [
            "12 või rohkem semestrit.",
            "10 või rohkem semestrit.",
            "11 või rohkem semestrit.",
        ],
    },
]
