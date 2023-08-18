//
//  ViewController.swift
//  3. UIAlertController Homework
//
//  Created by Владимир Есаян on 15.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Объявляю константы
    //Приветствие. Создаем лейбл и алерт
    private let labelForGreeting = UILabel()
    private let alertForGreeting = UIAlertController(title: "Welcome", message: "Enter your name", preferredStyle: .alert)
    //Игра на "Сложение". Создаем кнопку и поле ввода
    private let buttonAddition = UIButton()
    private let labelForSum = UILabel()
    //Игра "Угадай число". Создаем кнопку и поле ввода
    private let buttonGuessTheNumber = UIButton()
    private let labelForGuessTheNumber = UILabel()
    
    //MARK: - ViewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        //Настройка цвета фона View (задний фон экрана)
        self.view.backgroundColor = .systemMint
        //MARK: - Настраиваем приветственное сообщение
        //Настройка текста при приветствии, который изначально будет
        labelForGreeting.text = ""
        //размер шрифта текста
        labelForGreeting.font = .systemFont(ofSize: 40, weight: .medium)
        //расположение текста
        labelForGreeting.textAlignment = .center
        //цвет текста
        labelForGreeting.textColor = .black
        //добавляем окно с приветствием на сам View
        self.view.addSubview(labelForGreeting)
        //отключаем автоматическое добавление системных ограничений (constraits)
        labelForGreeting.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits (ограничения)
        NSLayoutConstraint.activate([
            labelForGreeting.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            labelForGreeting.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            labelForGreeting.widthAnchor.constraint(equalToConstant: 300),
            labelForGreeting.heightAnchor.constraint(equalToConstant: 50)
        ])
        //Добавляем текстовое поле к приветствию
        alertForGreeting.addTextField { textField in
            //пока не ввели свой такст
            textField.placeholder = "Enter Your name"
            //метод, который делает так, чтобы данное окно появилось сразу, после открытия приложения
            textField.becomeFirstResponder()
        }
        //Создание кнопки для приветствия и обработки нажатия
        let buttonForGreetingAlert = UIAlertAction(title: "OK", style: .default) { _ in
            if let userText = self.alertForGreeting.textFields?.first?.text {
                if !userText.isEmpty {
                    self.labelForGreeting.text = "Hi, \(userText)"
                } else {
                    self.labelForGreeting.text = "Hi, Guest"
                }
            }
        }
        //Добавляем кнопку к приветствию
        self.alertForGreeting.addAction(buttonForGreetingAlert)
        //MARK: - Игра "Сложение"
        //MARK: - Настройка кнопки
        //Настраиваем текст кнопки
        //устанавливаем название кнопки
        buttonAddition.setTitle("Addition", for: .normal)
        //устанавливаем размер шрифтра названия кнопки
        buttonAddition.titleLabel?.font = .systemFont(ofSize: 30)
        //устанавливаем цвет текста кнопки
        buttonAddition.setTitleColor( .black, for: .normal)
        
        //Настройка фона кнопки
        //устанавливаем цвет фона
        buttonAddition.backgroundColor = UIColor(red: 0.8, green: 1, blue: 0.9, alpha: 1)
        //закругление фона
        buttonAddition.layer.cornerRadius = 15
        //ширина границ
        buttonAddition.layer.borderWidth = 6
        //закрашивание границ
        buttonAddition.layer.borderColor = CGColor(red: 0.5, green: 1, blue: 1, alpha: 1)
        //Добавление действия и обработчика действия к кнопке
        buttonAddition.addTarget(self, action: #selector(addition), for: .touchUpInside)
        //добавление кнопки к view
        self.view.addSubview(buttonAddition)
        //отключение автоматических constrait
        buttonAddition.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits
        NSLayoutConstraint.activate([
            //позиционирование
            buttonAddition.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonAddition.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -75),
            //установка размера
            buttonAddition.widthAnchor.constraint(equalToConstant: 300),
            buttonAddition.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        //MARK: - Настройка метки
        //Настройка текста метки
        //расположение текста
        labelForSum.textAlignment = .center
        //размер шрифта
        labelForSum.font = .systemFont(ofSize: 20)
        //цвет текста
        labelForSum.textColor = .black
        //Добавление метки на View
        self.view.addSubview(labelForSum)
        //отключение автоматических constrait
        labelForSum.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits
        NSLayoutConstraint.activate([
            //позиционирование
            labelForSum.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            labelForSum.centerYAnchor.constraint(equalTo: self.buttonAddition.centerYAnchor, constant: 50),
            //установка размера
            labelForSum.widthAnchor.constraint(equalToConstant: 350),
            labelForSum.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //MARK: - Игра "Угадай число"
        //MARK: - Настройка кнопки
        //настройка текста кнопки
        //название кнопки
        buttonGuessTheNumber.setTitle("Game \"Guess the number\"", for: .normal)
        //размер шрифта
        buttonGuessTheNumber.titleLabel?.font = .systemFont(ofSize: 30)
        //цвет текста
        buttonGuessTheNumber.setTitleColor(.black, for: .normal)
        //настройки фона кнопки
        //цвет фона
        buttonGuessTheNumber.backgroundColor = UIColor(red: 0.8, green: 1, blue: 0.9, alpha: 1)
        //ширина фона
        buttonGuessTheNumber.layer.borderWidth = 5
        //цвет заливки
        buttonGuessTheNumber.layer.borderColor = CGColor(red: 0.5, green: 1, blue: 1, alpha: 1)
        //закругление фона
        buttonGuessTheNumber.layer.cornerRadius = 15
        //добавление действия и обработчика действия к кнопке
        buttonGuessTheNumber.addTarget(self, action: #selector(guessTheNumber), for: .touchUpInside)
        //добавление кнопки к View
        self.view.addSubview(buttonGuessTheNumber)
        //отлючение автоматических constrait
        buttonGuessTheNumber.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits
        NSLayoutConstraint.activate([
            //позиционирование
            buttonGuessTheNumber.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonGuessTheNumber.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 80),
            //установка размеров
            buttonGuessTheNumber.widthAnchor.constraint(equalToConstant: 370),
            buttonGuessTheNumber.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        //MARK: - Настройка метки
        //настройка метки текста
        //расположение текста по центру
        labelForGuessTheNumber.textAlignment = .center
        //размер шрифтра
        labelForGuessTheNumber.font = .systemFont(ofSize: 20)
        //цвет шрифта
        labelForGuessTheNumber.textColor = .black
        //добавление метки к View
        self.view.addSubview(labelForGuessTheNumber)
        //отключение автоматических constraits
        labelForGuessTheNumber.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits
        NSLayoutConstraint.activate([
            //позиционирование
            labelForGuessTheNumber.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            labelForGuessTheNumber.centerYAnchor.constraint(equalTo: self.buttonGuessTheNumber.centerYAnchor, constant: 30),
            //установка размеров
            labelForGuessTheNumber.widthAnchor.constraint(equalToConstant: 350),
            labelForGuessTheNumber.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    //MARK: - ViewDidAppear method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //делаем так, чтобы появлилось приветствие сразу после загрузки экрана
        self.present(alertForGreeting, animated: true)
    }
    
    //MARK: - обработчик нажатия на кнопку "buttonAddition"
    //метод кноки на сложение. название поля
    @objc func addition() {
        let alert = UIAlertController(title: nil, message: "Enter two numbers", preferredStyle: .alert)
        var a: Int?
        var b: Int?
        //текст в поле для первого и второго числа
        alert.addTextField { textField in
            textField.placeholder = "Enter the first number"
        }
        alert.addTextField { textField in
            textField.placeholder = "Enter the second number"
        }
        let buttonForAlert = UIAlertAction(title: "Sum", style: .default) {_ in
            var firstNumber = alert.textFields?[0].text
            var secondNumber = alert.textFields?[1].text
            //если поле пустое, то в нем надпись
            if firstNumber == nil || secondNumber == nil {
                firstNumber = "first number"
                secondNumber = "second number"
            }
            //исключение введения неверных значений
            if Int(firstNumber!) != nil && Int(secondNumber!) != nil {
                a = Int(firstNumber!)!
                b = Int(secondNumber!)!
                self.labelForSum.text = "\(a!) + \(b!) = \(a! + b!)"
            } else {
                self.labelForSum.text = "Invalid values ​​entered"
            }
        }
        //связь между кнопкой и действием
        alert.addAction(buttonForAlert)
        self.present(alert, animated: true)
    }
    
    // метод для кнопки "buttonGuessTheNumber"
    @objc func guessTheNumber() {
        //имя контроллера
        let alert = UIAlertController(title: nil, message: "Guess the number from 1 to 10", preferredStyle: .alert)
        //загаданное число выбирается случайно
        let guessedNumber = Int.random(in: 1...10)
        //число, которое загадал пользователь
        var userNumber: Int?
        
        alert.addTextField { textField in
            //создание надписи
            textField.placeholder =  "Enter the number"
        }
        
        // создание кнопки проверки игры на угадывание числа
        let buttonForAlert = UIAlertAction(title: "Check", style: .default) { _ in
            if let userText = alert.textFields?.first?.text {
                userNumber = Int(userText)
            }
            //условие введения корректного значения
            if userNumber != nil {
                if userNumber == guessedNumber {
                    self.labelForGuessTheNumber.text = "Well done! You guessed right!"
                } else {
                    self.labelForGuessTheNumber.text = "Sorry, but the hidden number was \(guessedNumber)"
                }
            } else {
                self.labelForGuessTheNumber.text = "You enter invalid value"
            }
        }
        alert.addAction(buttonForAlert)
        self.present(alert, animated: true)
    }
}
