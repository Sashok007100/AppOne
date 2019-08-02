//
//  TeachersViewController.swift
//  Teachers
//
//  Created by Alexandr Artemov on 31/07/2019.
//  Copyright © 2019 Alexandr Artemov. All rights reserved.
//

import UIKit

class TeachersViewController: UIViewController {

    var currentRows: String?
    
    // Массив всех предметов во всех семестрах
    let oneSemestr = ["Алгебра и геометрия", "Введение в программную инженерию", "Иностранный язык",
                      "Информатика", "История", "Математический анализ",
                      "Процедурное программирование","Физика", "Физическая культура и спорт"]
    
    let twoSemestr = ["Алгебра и геометрия", "Анализ сложности алгоритмов", "Дискретная математика",
                      "Иностранный язык", "Математический анализ", "Объектно-ориентированное программирование",
                      "Правоведение", "Физика", "Физическая культура и спорт"]
    
    let threeSemestr = ["Иностранный язык", "Математическая логикаи теория автоматов", "Математический анализ",
                        "Моделирования бизнес процессов", "Объектно-ориентированное программирование", "Структура и алгоритмы обработки данных",
                        "Физическая культура и спорт", "Философия"]
    
    let fourSemestr = ["Архитектура вычислительных машин и систем", "Иностранный язык", "Информационные системы и технологии",
                       "Проектирование и разработка баз данных", "Разработка программных приложений", "Системна и программная инженерия",
                       "Структура и алгоритмы обработки данных", "Теория вероятности и математическая статистика", "Физическая культура и спорт",
                       "Экономика"]
    
    let fiveSemestr = ["Архитектура вычислительных машин и систем", "Безопасность жизнедеятельности", "Информационные системы и технологии",
                       "Компьютерная графика", "Основы сетевых технологий", "Проектирование и разработка баз данных",
                       "Разработка клиент-серверных приложений", "Системна и программная инженерия", "Теория автоматов и формальных языков",
                       "Физическая культура и спорт"]
    
    let sixSemestr = ["Гражданская оборона", "Интелектуальные информационные системы", "Компьютерная графика",
                      "Основы интеллектуального анализа данных", "Основы научно-технического творчества", "Основы сетевых технологий",
                      "Программные средства защиты информации", "Проектирование информационных систем", "Психология",
                      "Системное программное обеспечение", "Теория систем и системный анализ", "Тестирование и отладка программного обеспечения",
                      "Управление предприятием", "Физическая культура и спорт", "Экономия предприятия"]
    
    let sevenSemestr = ["Архитектура программных продуктов", "Имитационное моделирование инофрмационных систем", "Инженерно-техническая лексика",
                        "Информационная безопасность программных продуктов и систем", "Информационно-поисковые системы", "Информационные системы мониторинга и управления инцидентами",
                        "Информационные технологии Интернета вещей", "Качество и стандартизация программных продуктов и систем", "Мультимедия технологии",
                        "Научно-исследовательская работа", "Национальная система информационной безопасности", "Обеспечение безопасности информационных систем",
                        "Основы интеллектуальных информационных систем", "Программное обеспечение интеллектуальных систем", "Системы управления информационно-технологическими сервисами и контентом",
                        "Тестирование и отладка программного обеспечения", "Техническая лексика в научной литературе", "Технологии разработки программного обеспечения",
                        "Управление проектами информатизации"]
    
    let eightSemestr = ["Архитектура программных продуктов", "Выпускная квалификационная работа", "Государственный экзамен",
                        "Информационные технологии Интернета вещей", "Информационные менеджмент систем", "Научно-исследовательская работа",
                        "Проектирование человека-машинного интерфейса", "Теория принятия решений", "Технология облачных вычислений"]
    
    @IBOutlet weak var detailTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Подпись на delegate и dataSource
        detailTable.delegate = self
        detailTable.dataSource = self
    }
    
}

//MARK: - TableView DataSource
extension TeachersViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Устанавливается высота строки 90
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    // Проверяется сколько дожно быть строк в секции после выбора строки "семестр"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentRows == "1 семестр" {
            return oneSemestr.count
        } else if currentRows == "2 семестр" {
            return twoSemestr.count
        } else if currentRows == "3 семестр" {
            return threeSemestr.count
        } else if currentRows == "4 семестр" {
            return fourSemestr.count
        } else if currentRows == "5 семестр" {
            return fiveSemestr.count
        } else if currentRows == "6 семестр" {
            return sixSemestr.count
        } else if currentRows == "7 семестр" {
            return sevenSemestr.count
        } else if currentRows == "8 семестр" {
            return eightSemestr.count
        } else {
            return 0
        }
    }
    
    // Привязка и редактирование ячейка
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        // Проверяется что должно быть написанно в каждой по счёту строке
        if currentRows == "1 семестр" {
            cell.textLabel?.text = oneSemestr[indexPath.row]
        } else if currentRows == "2 семестр" {
            cell.textLabel?.text = twoSemestr[indexPath.row]
        } else if currentRows == "3 семестр" {
            cell.textLabel?.text = threeSemestr[indexPath.row]
        } else if currentRows == "4 семестр" {
            cell.textLabel?.text = fourSemestr[indexPath.row]
        } else if currentRows == "5 семестр" {
            cell.textLabel?.text = fiveSemestr[indexPath.row]
        } else if currentRows == "6 семестр" {
            cell.textLabel?.text = sixSemestr[indexPath.row]
        } else if currentRows == "7 семестр" {
            cell.textLabel?.text = sevenSemestr[indexPath.row]
        } else if currentRows == "8 семестр" {
            cell.textLabel?.text = eightSemestr[indexPath.row]
        }
        
        // Автоматический перенос текста
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}
