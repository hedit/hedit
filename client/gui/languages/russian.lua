guiLanguage.russian = {
    --
    -- GENERAL STRINGS
    --
    windowHeader = "Редактор Handling v"..HVER.." r"..HREV,
    
    restrictedPassenger = "Вы не можете использоват редактор в качестве пассажира.",
    needVehicle = "Вы должны сесть в транспорт чтобы использовать редактор!",
    needLogin = "Авторизуйтесь для пользования этим меню.",
    needAdmin = "Только администратор может использовать это меню",
    invalidMenu = "Этого меню не существует!",
    disabledMenu = "Это меню было отключено.",
    notifyUpdate = "Этот редактор был обнослён со времени его последнего использования. Чтобы просмтореть список изменений нажмите 'Extra > Updates'",
    notifyUpgrade = "The handling editor has been UPGRADED. This means some of your files, such as saved handlings have been changed to another format. As a result, servers with an outdated version of hedit are not fully supported.\nWould you like to see a list of changes now? \nYou can always see the list of changes at 'Extra > Updates'",
    outdatedUpdate = "Этот сервер использует устаревшую версию редактора и вмогут быть недоступны некоторые функции. Обратитесь к администратору.",
    outdatedUpgrade = "This server runs an extremely outdated version of the handling editor. As a result, all settings/saved handling settings are incompatible.\nPlease contact an administrator.",
    mtaUpdate = "If you have any saved handlings on MTA 1.1, your handlings are no longer compatible; please visit 'http://hedit.googclecode.com/' for details.",
    
    sameValue = "The %s is already that!",
    exceedLimits = "Используется значение %s превышающее предел. [%s]!",
    cantSameValue = "%s may not the same as %s!",
    needNumber = "Вы должны использовать цифры!",
    unsupportedProperty = "%s не поддерживается собственности.",
    successRegular = "%s установлено на %s.",
    successHex = "%s %s.",
    unableToChange = "Не удаётся установить %s на %s!",
    
    resetted = "Удачно возвращены стандартные настройки!",
    loaded = "Удачно загружены настройки!",
    imported = "Удачно импортированы настройки!",
    invalidImport = "Ошибка импорта; данные не допустимы!",
    invalidSave = "Пожалуйста укажите правильное имя и описание для сохранения!",
    
    confirmReplace = "Вы уверены, что хотите, чтобы заменить существующий сохранения?",
    confirmLoad = "Вы уверены, что хотите, чтобы загрузить эти настройки обработки? Все несохраненные изменения будут потеряны!",
    confirmDelete = "Вы уверены, что хотите удалить эти параметры?",
    confirmReset = "Вы уверены, что хотите сбросить ваши параметры? Все несохраненные изменения будут потеряны!",
    confirmImport = "Вы умерены что хотит еимпортировать эти настройки? Все несохраненные изменения будут потеряны!",

    successSave = "Удачно сохранены параметры!",
    successLoad = "Удачно загружены параметры!",
    
	confirmVersionReset = "Are you sure you want to set your editor version number to the one of this server? Your saved handlings may become incompatible.",
	successVersionReset = "Для вашей версии вышло обновление.",
    wantTheSettings = "Вы действительно хотите применить это? Редактор перезагрузится.",
    
    vehicle = "Транспорт",
    unsaved = "Несохраненные",
    
    clickToEdit = "Кликните для редактирования.",
    enterToSubmit = "Нажмите Enter чтобы подтвердить.",
    clickToViewFullLog = "Нажмите чтобы посмотреть полный лог.",
    copiedToClipboard = "Параметры были занесены в Буфер обмена!",
    
    special = {
        commode = {
            "Split",
            "Merged"
        }
    },
    
    --
    -- BUTTON / MENU STRINGS
    --
    
    --Warning level strings
    warningtitles = {
        info = "Информация",
        question = "Вопрос",
        warning = "Внимание!",
        ["error"] = "Ошибка!"
    },
    --Strings for the buttons at the top
    utilbuttons = {
        handling = "Настр.",
        tools = "Функции",
        extra = "Экстра",
        close = "X"
    },

    --Strings for the buttons at the right
    menubuttons = {
        engine = "Движок",
        body = "Тело",
        wheels = "Колёса",
        appearance = "Вид",
        modelflags = "Модель\nФлаги",
        handlingflags = "Настр.\nФлаги",
        dynamometer = "Динам.",
        help = "Помощь"
    },
    
    --Strings for the various menus of the editor. Empty strings are placeholder to avoid debug as the debug is meant to show items which are missing text.
    menuinfo = {
        engine = {
            shortname = "Движок",
            longname = "Настройки двигателя"
        },
        body = {
            shortname = "Тело",
            longname = "Тело & Подвеска"
        },
        wheels = {
            shortname = "Колёса",
            longname = "Настройка колёс"
        },
        appearance = {
            shortname = "Вид",
            longname = "Настройки вида"
        },
        modelflags = {
            shortname = "Флаги модели",
            longname = "Настройки модели"
        },
        handlingflags = {
            shortname = "Флаги обратобки",
            longname = "Специальные настройки обработки"
        },
        dynamometer = {
            shortname = "Динамика",
            longname = "Старт Замера динамики"
        },
        help = {
            shortname = "Помощь и информация",
            longname = "Помощь",
            itemtext = {
                textlabel = "Добро пожаловать в оффициальный МТА обработчик транспорта! Этот ресурс позволит редактировать настройки в реальном времени прямо в игре.\n"..
                            "Вы можете загружать и сохранять ваши индивидуальные настройки в верхнем правом углу во вкладке Настр.\n"..
                            "Постмотреть прочую информацию вы можете посетив оффициальную страницу:\n",
                websitebox = "http://hedit.googlecode.com/",
                morelabel = "Спасибо за пользование! Перевод выполнен командой [BS], наша группа ВКонтакте vk.com/bsmta а так-же наш сайт bsmta.3dn.ru"
            }
        },
        reset = {
            shortname = "Возврат",
            longname = "Сбросить настройки.",
            itemtext = {
                label = "Базовый транспорт:",
                combo = "-----",
                button = "Сброс"
            }
        },
        save = {
            shortname = "Сохран.",
            longname = "Сохранить текущие настройки.",
            itemtext = {
                nameLabel = "Имя",
                descriptionLabel = "Описание",
                button = "Сохранить",
                grid = "",
                nameEdit = "",
                descriptionEdit = ""
            }
        },
        load = {
            shortname = "Загруз.",
            longname = "Загрузить выбранные настройки.",
            itemtext = {
                button = "Загруз.",
                grid = ""
            }
        },
        import = {
            shortname = "Импорт",
            longname = "Импортировать настройки из файла handling.cfg.",
            itemtext = {
                button = "Импорт",
                III = "III",
                VC = "VC",
                SA = "SA",
                IV = "IV",
                memo = ""
            }
        },
        export = {
            shortname = "Экспорт",
            longname = "Экспортировать настройки в handling.cfg формат.",
            itemtext = {
                button = "Копировать в Буфер",
                memo = ""
            }
        },
        get = {
            shortname = "Получить",
            longname = "Получить настройки другого игрока."
        },
        share = {
            shortname = "Отправить",
            longname = "Отправить свои натройки другим игрокам."
        },
        upload = {
            shortname = "Выгрузить",
            longname = "Выгрузить настройки с сервера."
        },
        download = {
            shortname = "Скачать",
            longname = "Загрузить настройки на сервер."
        },
        
        resourcesave = {
            shortname = "Сохр. Рес.",
            longname = "Сохранить настройки в ресурс."
        },
        resourceload = {
            shortname = "Загр. Рес.",
            longname = "Загрузить настройки из ресурса."
        },
        options = {
            shortname = "Опции",
            longname = "Опции",
            itemtext = {
                label_key = "Кнопка вызова",
                label_cmd = "Команда вызова:",
                label_template = "GUI шаблон:",
                label_language = "Язык:",
                label_commode = "Редактор центра массы:",
                checkbox_versionreset = "Downgrade my version number from %s to %s?",
                button_save = "Применить",
                combo_key = "",
                combo_template = "",
                edit_cmd = "",
                combo_commode = "",
                combo_language = "",
				checkbox_lockwhenediting = "Закрыть на момент редактирования?"
            }
        },
        administration = {
            shortname = "Администрация",
            longname = "Функции администратора."
        },
        handlinglog = {
            shortname = "Лог настроек",
            longname = "Последние изменения настроек.",
            itemtext = {
                logpane = ""
            }
        },
        updatelist = {
            shortname = "Обносления",
            longname = "Лист последних обновлений.",
            itemtext = {
                scrollpane = ""
            }
        },
        mtaversionupdate = {
            shortname = "MTA Обновление",
            longname = "Multi Theft Auto has been updated!",
            itemtext = {
                infotext = "Multi Theft Auto has been updated. Because of this, your saved handlings in the previous version are no longer compatible. Please visit the link below for help and get your handlings back.",
                websitebox = "http://hedit.googlecode.com/"
            }
        }
    },
    
    --
    --NOTE: 12/17/2011 This section is pending review for typos and grammar.
    --
    handlingPropertyInformation = { 
        ["identifier"] = {
            friendlyName = "Идентификатор транспорта",
            information = "Представляет идентификатор для использования в handling.cfg.",
            syntax = { "Строка", "Используйте только допустимыми идентификаторами, в противном случае экспорт не будет работать." }
        },
        ["mass"] = {
            friendlyName = "Масса",
            information = "Устанавливает вес авто в КГ.",
            syntax = { "Переменная", "Не забудьте изменить [turnMass] первой, чтобы избежать подпрыгивая!" }
        },
        ["turnMass"] = {
            friendlyName = "Ходовая масса",
            information = "Используется для расчета эффекта движения.",
            syntax = { "Переменная", "Более высокие значения делают ваш автомобиль лёгче." }
        },
        ["dragCoeff"] = {
            friendlyName = "Перемещение Множителя",
            information = "Изменение сопротивления движению.",
            syntax = { "Переменная", "Чем выше значение, тем меньше шанс максимальной скорости." }
        },
        ["centerOfMass"] = {
            friendlyName = "ЦМ",
            information = "Центры гравитации. Устанавливает точки гравитации на транспорте, в Метрах.",
            syntax = { "Переменная", "Использовать X, Y, и Z для получения информации." }
        },
        ["centerOfMassX"] = {
            friendlyName = "X",
            information = "Установка переднего и заднего расстояния от центра массы в метрах.",
            syntax = { "Переменная", "Более высокие значения значения на перед, ниже задних значений." }
        },
        ["centerOfMassY"] = {
            friendlyName = "Y",
            information = "Установка левого и правого расстояния от центра массы в метрах.",
            syntax = { "Переменная", "Более высокие значения находятся справа и ниже левых значений." }
        },
        ["centerOfMassZ"] = {
            friendlyName = "Z",
            information = "Устанавливает высоту вверх и вниз от центра массы в метрах.",
            syntax = { "Переменная", "Чем выше значение тем выше точка." }
        },
        ["percentSubmerged"] = {
            friendlyName = "Процент погрузки",
            information = "Установить насколько глубоко транспорт может погружаться в воду.",
            syntax = { "Целое", "Высокие значения установят более высокую глубину для погружения." }
        },
        ["tractionMultiplier"] = {
            friendlyName = "Множитель сцепления",
            information = "Устанавливает захват значения угла транспорта.",
            syntax = { "Переменная", "Высокие значения приводят к мощному захвату." }
        },
        ["tractionLoss"] = {
            friendlyName = "Убыток сцепления",
            information = "Устанавливает захват значения ускорения и замедления.",
            syntax = { "Переменная", "Высокие значения заставляют транспорт резать угол угла." }
        },
        ["tractionBias"] = {
            friendlyName = "Смещение сцепления",
            information = "Натсройкт захвата колёс на дороге.",
            syntax = { "Переменная", "Высокие значения устанавливают большое смещение вперёд." }
        },
        ["numberOfGears"] = {
            friendlyName = "Количество шестерней",
            information = "Установить количество шестерней для двигателя.",
            syntax = { "Целое", "Не даёт эффекта при большом значении ускорения." }
        },
        ["maxVelocity"] = {
            friendlyName = "Максимальная скорость",
            information = "Устанавливает максимальную скорость в километрах.",
            syntax = { "Переменная", "Может быть не естественно с другими настройками." }
        },
        ["engineAcceleration"] = {
            friendlyName = "Ускорение",
            information = "Устанавливает ускорение на MS^2 текущего транспорта.",
            syntax = { "Переменная", "Высокие значения увеличивают скорость разгона." }
        },
        ["engineInertia"] = {
            friendlyName = "Инерция",
            information = "Сглаживание искривлений ускорения.",
            syntax = { "Переменная", "Высокие значения сильно сглаживают ускорение." }
        },
        ["driveType"] = {
            friendlyName = "Привод",
            information = "Привод автомобиля",
            syntax = { "Серия", "Выбор привода двигателя для вождения." },
            options = { ["f"]="Передний",["r"]="Задний",["4"]="4х4" }
        },
        ["engineType"] = {
            friendlyName = "Тип двигателя",
            information = "Выберите тип двигателя.",
            syntax = { "Серия", "[UNKNOWN]" },
            options = { ["p"]="Бензин",["d"]="Дизель",["e"]="Электрика" }
        },
        ["brakeDeceleration"] = {
            friendlyName = "Тормоз",
            information = "Установите значение тормоза для MS^2.",
            syntax = { "Переменная", "Высокие значения замедляют силу, но возможно скольжение его сцепления на маленькой скорости." }
        },
        ["brakeBias"] = {
            friendlyName = "Смещение тормоза",
            information = "Устанавливает основную позицию тормозов.",
            syntax = { "Переменная", "Высокие значения устанавливают смещение в переднюю часть." }
        },
        ["ABS"] = {
            friendlyName = "ABS",
            information = "Включить или отключить ABS в транспорте.",
            syntax = { "Логика", "Без эффекта." },
            options = { ["true"]="Включен",["false"]="Отключен" }
        },
        ["steeringLock"] = {
            friendlyName = "Блокировка управления",
            information = "Устанавливает максимальный угол управления транспортом.",
            syntax = { "Переменная", "Управление углом становится медленным или быстрым в ходовой функции." }
        },
        ["suspensionForceLevel"] = {
            friendlyName = "Уровень усиленного зависания",
            information = "Неизвестны эффекты.",
            syntax = { "Переменная", "Неизвестны." }
        },
        ["suspensionDamping"] = {
            friendlyName = "Зависание торможением",
            information = "Неизвестны эффекты.",
            syntax = { "Переменная", "Неизвестны." }
        },
        ["suspensionHighSpeedDamping"] = {
            friendlyName = "Зависание на высокой скорости торможения",
            information = "Устанавливает зависание при быстрой езде.",
            syntax = { "Переменная", "Не тестировались" } -- HERE
        },
        ["suspensionUpperLimit"] = {
            friendlyName = "Зависание предельного лимита",
            information = "Наивысшее перемещение колёс в метрах.",
            syntax = { "Переменная", "Не тестировались" } -- HERE
        },
        ["suspensionLowerLimit"] = {
            friendlyName = "Подвеска",
            information = "Высота вашей подвески.",
            syntax = { "Переменная", "Низкие значения делают ваш транспорт выше." }
        },
        ["suspensionFrontRearBias"] = {
            friendlyName = "Пропорциональность подвески",
            information = "Устанавливается пропорция передней и задней стороны подвески.",
            syntax = { "Переменная", "Низкие значения опускают переднюю чать." }
        },
        ["suspensionAntiDiveMultiplier"] = {
            friendlyName = "Резкость старта авто",
            information = "При средних значениях во время старта будет поднимать перед авто.",
            syntax = { "Переменная", "" }
        },
        ["seatOffsetDistance"] = {
            friendlyName = "Расстояние посадки двери",
            information = "Усстановить расстояние до двери при взаимодействии с транспортом.",
            syntax = { "Переменная", "" }
        },
        ["collisionDamageMultiplier"] = {
            friendlyName = "Получение урона",
            information = "Устанавливает получение урона при столкновениями с объектами.",
            syntax = { "Переменная", "" }
        },
        ["monetary"] = {
            friendlyName = "Monetary Value",
            information = "Sets the exact price of your vehicle.",
            syntax = { "Переменная", "" }
        },
        ["modelFlags"] = {
            friendlyName = "Модельные флаги",
            information = "Управление специальными анимациями характеристик.",
            syntax = { "Шестнадцетиричные", "" },
            items = {
                {
                    ["1"] = {"IS_VAN","Allows double doors for the rear animation."},
                    ["2"] = {"IS_BUS","Vehicle uses bus stops and will try to take on passengers."},
                    ["4"] = {"IS_LOW","Drivers and passengers sit lower and lean back."},
                    ["8"] = {"IS_BIG","Changes the way that the AI drives around corners."}
                },
                {
                    ["1"] = {"REVERSE_BONNET","Bonnet and boot open in opposite direction from normal."},
                    ["2"] = {"HANGING_BOOT","Boot opens from top edge."},
                    ["4"] = {"TAILGATE_BOOT","Boot opens from bottom edge."},
                    ["8"] = {"NOSWING_BOOT","Boot does not open."}
                },
                {
                    ["1"] = {"NO_DOORS","Door open and close animations are skipped."},
                    ["2"] = {"TANDEM_SEATS","Two people will use the front passenger seat."},
                    ["4"] = {"SIT_IN_BOAT","Uses seated boat animation instead of standing."},
                    ["8"] = {"CONVERTIBLE","Changes how hookers operate and other small effects."}
                },
                {
                    ["1"] = {"NO_EXHAUST","Removes all exhaust particles."},
                    ["2"] = {"DBL_EXHAUST","Adds a second exhaust particle on opposite side to first."},
                    ["4"] = {"NO1FPS_LOOK_BEHIND","Prevents player using rear view when in first-person mode."},
                    ["8"] = {"FORCE_DOOR_CHECK","Needs testing."}
                },
                {
                    ["1"] = {"AXLE_F_NOTILT","Front wheels stay vertical to the car like GTA 3."},
                    ["2"] = {"AXLE_F_SOLID","Front wheels stay parallel to each other."},
                    ["4"] = {"AXLE_F_MCPHERSON","Front wheels tilt like GTA Vice City."},
                    ["8"] = {"AXLE_F_REVERSE","Reverses the tilting of wheels when using AXLE_F_MCPHERSON suspension."}
                },
                {
                    ["1"] = {"AXLE_R_NOTILT","Rear wheels stay vertical to the car like GTA 3."},
                    ["2"] = {"AXLE_R_SOLID","Rear wheels stay parallel to each other."},
                    ["4"] = {"AXLE_R_MCPHERSON","Rear wheels tilt like GTA Vice City."},
                    ["8"] = {"AXLE_R_REVERSE","Reverses the tilting of wheels when using AXLE_R_MCPHERSON suspension."}
                },
                {
                    ["1"] = {"IS_BIKE","Use extra handling settings in the bikes section."},
                    ["2"] = {"IS_HELI","Use extra handling settings in the flying section."},
                    ["4"] = {"IS_PLANE","Use extra handling settings in the flying section."},
                    ["8"] = {"IS_BOAT","Use extra handling settings in the flying section."}
                },
                {
                    ["1"] = {"BOUNCE_PANELS","Needs testing."},
                    ["2"] = {"DOUBLE_RWHEELS","Places a second instance of each rear wheel next to the normal one."},
                    ["4"] = {"FORCE_GROUND_CLEARANCE","Needs testing."},
                    ["8"] = {"IS_HATCHBACK","Needs testing."}
                }
            }
        },
        ["handlingFlags"] = {
            friendlyName = "Флаги обработки",
            information = "Специальные настройки.",
            syntax = { "Шестнадцетиричные", "" },
            items = {
                {
                    ["1"] = {"1G_BOOST","Gives more engine power for standing starts; better hill climbing."},
                    ["2"] = {"2G_BOOST","Gives more engine power at slightly higher speeds."},
                    ["4"] = {"NPC_ANTI_ROLL","No body roll when driven by AI characters."},
                    ["8"] = {"NPC_NEUTRAL_HANDL","Less likely to spin out when driven by AI characters."}
                },
                {
                    ["1"] = {"NO_HANDBRAKE","Disables the handbrake effect."},
                    ["2"] = {"STEER_REARWHEELS","Rear wheels steer instead of front, like a forklift truck."},
                    ["4"] = {"HB_REARWHEEL_STEER","Handbrake makes the rear wheels steer as well as front, like the monster truck"},
                    ["8"] = {"ALT_STEER_OPT","Needs testing."}
                },
                {
                    ["1"] = {"WHEEL_F_NARROW2","Very narrow front wheels."},
                    ["2"] = {"WHEEL_F_NARROW","Narrow front wheels."},
                    ["4"] = {"WHEEL_F_WIDE","Wide front wheels."},
                    ["8"] = {"WHEEL_F_WIDE2","Very wide front wheels."}
                },
                {
                    ["1"] = {"WHEEL_R_NARROW2","Very narrow rear wheels."},
                    ["2"] = {"WHEEL_R_NARROW","Narrow rear wheels."},
                    ["4"] = {"WHEEL_R_WIDE","Wide rear wheels."},
                    ["8"] = {"WHEEL_R_WIDE2","Very wide rear wheels."}
                },
                {
                    ["1"] = {"HYDRAULIC_GEOM","Needs testing."},
                    ["2"] = {"HYDRAULIC_INST","Will spawn with hydraulics installed."},
                    ["4"] = {"HYDRAULIC_NONE","Hydraulics cannot be installed."},
                    ["8"] = {"NOS_INST","Vehicle automatically gets NOS installed when it spawns."}
                },
                {
                    ["1"] = {"OFFROAD_ABILITY","Vehicle will perform better on loose surfaces like dirt."},
                    ["2"] = {"OFFROAD_ABILITY2","Vehicle will perform better on soft surfaces like sand."},
                    ["4"] = {"HALOGEN_LIGHTS","Makes headlights brighter and more blue."},
                    ["8"] = {"PROC_REARWHEEL_1ST","Needs testing."}
                },
                {
                    ["1"] = {"USE_MAXSP_LIMIT","Prevents vehicle going faster than the maximum speed."},
                    ["2"] = {"LOW_RIDER","Allows vehicle to be modified at Loco Low Co shops."},
                    ["4"] = {"STREET_RACER","When set, vehicle can only be modified at Wheel Arch Angels."},
                    ["8"] = {"UNDEFINED","No effect."}
                },
                {
                    ["1"] = {"SWINGING_CHASSIS","Lets the car body move from side to side on the suspension."},
                    ["2"] = {"UNDEFINED","No effect."},
                    ["4"] = {"UNDEFINED","No effect."},
                    ["8"] = {"UNDEFINED","No effect."}
                }
            }
        },
        ["headLight"] = {
            friendlyName = "Главные фары",
            information = "Установить тип главных фар.",
            syntax = { "Целое", "" },
            options = { ["0"]="Длинные",["1"]="Маленькие",["2"]="Большие",["3"]="Высокие" }
        },
        ["tailLight"] = {
            friendlyName = "Верхние фары",
            information = "Установить тип верхних фар.",
            syntax = { "Целое", "" },
            options = { ["0"]="Длинные",["1"]="Маленькие",["2"]="Большие",["3"]="Высокие" }
        },
        ["animGroup"] = {
            friendlyName = "Группа анимаций",
            information = "Установить группу анимаций использующую для данного транспорта.",
            syntax = { "Целое", "" }
        }
    }
}