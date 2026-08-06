import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sotaynauan/models/dish_model.dart';

// Localized dish data - returns dishes in the specified language
List<Dish> getLocalizedDishes(Locale locale) {
  final bool isEnglish = locale.languageCode == 'en';

  return [
    Dish(
      id: '1',
      name: isEnglish ? 'Beef Pho' : 'Phở Bò',
      description: isEnglish
          ? 'Vietnamese beef noodle soup with fragrant broth, rice noodles, beef, and herbs.'
          : 'Súp bò Việt Nam với nước dùng thơm ngon, bánh phở mịn, thịt bò và rau thơm.',
      imageUrl: 'lib/imgs/phở-bò.png',
      ingredients: isEnglish
          ? [
              'Beef bones',
              'Beef flank',
              'Rice noodles',
              'Onion',
              'Ginger',
              'Star anise',
              'Cloves',
              'Cinnamon',
              'Cardamom',
              'Fish sauce',
              'Sugar',
              'Salt',
              'Bean sprouts',
              'Thai basil',
              'Lime',
              'Chili',
              'Hoisin sauce',
            ]
          : [
              'Xương bò',
              'Nạm bò',
              'Bánh phở',
              'Hành',
              'Gừng',
              'Hoà thảo',
              'Đinh hương',
              'Quế',
              'Đỉ',
              'Nước mắm',
              'Đường',
              'Muối',
              'Giá đỗ',
              'Húng lủi',
              'Chanh',
              'Ớt',
              'Tương đậu',
            ],
      steps: isEnglish
          ? [
              'Char the onion and ginger until slightly blackened.',
              'Parboil the beef bones to remove impurities, then rinse.',
              'In a large pot, add the charred onion and ginger, beef bones, and spices. Cover with water and bring to a boil.',
              'Reduce heat to a simmer and cook for 6-8 hours, occasionally skimming impurities.',
              'Strain the broth and season with fish sauce, sugar, and salt.',
              'Cook rice noodles according to package instructions.',
              'To serve, place noodles in a bowl, top with raw beef slices, and pour boiling broth over to cook the meat.',
              'Add cooked flank, bean sprouts, herbs, lime, and chili on the side.',
              'Serve with hoisin sauce and chili sauce if desired.',
            ]
          : [
              'Đường hành và gừng cho đến khi bẹp.',
              'Luộc xương bò để loại bỏ tạp chât, sau đó rửa lại.',
              'Trong một nồi lớn, cho xương bò, hành và gừng đã rang, thêm các loại gia vị, ngập nước và đun sôi.',
              'Giảm lửa hầm nhỏ và cho hành largas trong 6-8 tiếng, thường xuyên bỏ bọt.',
              'Lọc nước dùng và nêm với nước mắm, đường và muối.',
              'Luộc bánh phở theo hướng dẫn trên gói.',
              'Để phục vụ, đặt bánh phở vào tô, đặt thịt bò sinh lên trên và đổ nước dùng sôi để chín thịt.',
              'Thêm nạm bò đã luộc, giá đỗ, rau sống, chanh và ớt ở bên cạnh.',
              'Thưởng thức cùng tương đậu và ớt nếu muốn.',
            ],
      category: isEnglish ? 'Noodle' : 'Mì',
      difficulty: Difficulty.medium,
      prepTimeMinutes: 30,
      cookTimeMinutes: 480,
      tags: isEnglish
          ? ['beef', 'noodles', 'breakfast', 'lunch', 'dinner', 'snack']
          : ['bò', 'bánh phở', 'bữa sáng', 'bữa trưa', 'bữa tối', 'món ăn nhẹ'],
    ),
    Dish(
      id: '2',
      name: isEnglish ? 'Vietnamese Baguette' : 'Bánh Mì',
      description: isEnglish
          ? 'Vietnamese sandwich with crispy baguette, pâté, cold cuts, and pickled vegetables.'
          : 'Bánh mì Việt Nam với bánh mì giòn, pâté, thịt lạnh và đồ chua.',
      imageUrl: 'lib/imgs/bánh-mì.webp',
      ingredients: isEnglish
          ? [
              'Vietnamese baguette',
              'Pâté',
              'Cold cuts',
              'Carrot',
              'Daikon radish',
              'Cilantro',
              'Fresh chili',
              'Mayonnaise',
              'Soy sauce',
              'Chili sauce',
            ]
          : [
              'Bánh mì Việt',
              'Páté',
              'Thịt hun',
              'Dưa leo',
              'Đồ cà rốt và củ cải',
              'Húng lủi',
              'Ớt tươi',
              'Mayonnaise',
              'Nước tương',
              'Tương ớt',
            ],
      steps: isEnglish
          ? [
              'Cut the baguette lengthwise, leaving one edge intact as a hinge.',
              'Spread a thin layer of pâté on both sides of the bread.',
              'Place the cold cuts on the bottom half.',
              'Add pickled carrot and daikon, cucumber slices, cilantro, and chili.',
              'Before serving, drizzle with mayonnaise, soy sauce, and chili sauce.',
              'Close the sandwich and enjoy immediately.',
            ]
          : [
              'Cắt ngang bánh mì để tạo lớp nắp, không cắt completamente.',
              'Lăn một lớp mỏng páté ở hai mặt bánh.',
              'Đặt lớp thịt hun lên phần dưới.',
              'Thêm dưa leo, củ cải hành lam, thì là, và ớt.',
              'Trước khi phục vụ, rưới mayonnaise, nước tương, và tương ớt.',
              'Đóng bánh mì và thưởng thức ngay.',
            ],
      category: isEnglish ? 'Sandwich' : 'Bánh mì',
      difficulty: Difficulty.easy,
      prepTimeMinutes: 15,
      cookTimeMinutes: 0,
      tags: isEnglish
          ? ['pork', 'sandwich', 'lunch', 'breakfast', 'street food']
          : ['heo', 'bánh mì', 'bữa trưa', 'bữa sáng', 'địa điểm đường phố'],
    ),
    Dish(
      id: '3',
      name: isEnglish ? 'Fresh Spring Rolls' : 'Gỏi Cuốn',
      description: isEnglish
          ? 'Fresh spring rolls with shrimp, pork, vermicelli, and herbs.'
          : 'Gỏi cuốn tôm thịt với tôm, thịt heo, bún và các loại rau thơm.',
      imageUrl: 'lib/imgs/gỏi-cuốn.webp',
      ingredients: isEnglish
          ? [
              'Shrimp',
              'Pork',
              'Rice vermicelli',
              'Rice paper',
              'Lettuce',
              'Cilantro',
              'Mint',
              'Peanut hoisin sauce',
            ]
          : [
              'Tôm',
              'Thịt heo',
              'Bún',
              'Bánh tráng',
              'Xà lách',
              'Húng lủi',
              'Ngò rí',
              'Nước chấm peanut',
            ],
      steps: isEnglish
          ? [
              'Cook shrimp and pork until done, then cool and slice thinly.',
              'Soak rice paper in warm water until pliable.',
              'Place rice paper on a flat surface, add a small amount of vermicelli, shrimp, pork, and herbs.',
              'Roll tightly, keeping the filling inside.',
              'Roll firmly without exposing the filling.',
              'Serve with peanut hoisin sauce or fish sauce with lime and chili.',
              'Enjoy immediately.',
            ]
          : [
              'Luộc tôm và thịt heo tới chín, để nguội rồi cắt nhỏ.',
              'Nhúng bánh tráng vào nước ấm để uốn mềm.',
              'Đặt bánh tráng lên bề mặt phẳng, đặt ở giữa một ít bún, vài lát tôm, thịt heo, rau sống.',
              'Cuốn lại thành hình tròn hoặc tam giác, chắc chắn giữ nhân bên trong.',
              'Cuốn lại chắc chắn, không để lộ nhân.',
              'Ăn kèm với nước chấm peanut hoặc nước mắm pha đường ớt.',
              'Thưởng thức ngay.',
            ],
      category: isEnglish ? 'Appetizer' : 'Gỏi',
      difficulty: Difficulty.easy,
      prepTimeMinutes: 20,
      cookTimeMinutes: 10,
      tags: isEnglish
          ? ['shrimp', 'pork', 'vermicelli', 'herbs', 'appetizer']
          : ['tôm', 'heo', 'bún', 'rau sống', 'món khai vị'],
    ),
    Dish(
      id: '4',
      name: isEnglish ? 'Grilled Pork with Vermicelli' : 'Bún Chả',
      description: isEnglish
          ? 'Hanoi-style grilled pork with vermicelli, dipping sauce, and fresh herbs.'
          : 'Bún chả Hà Nội với thịt nướng, bún, nước mắm pha và rau sống.',
      imageUrl: 'lib/imgs/bún-chả.jpg',
      ingredients: isEnglish
          ? [
              'Pork belly',
              'Ground pork',
              'Rice vermicelli',
              'Shallot',
              'Garlic',
              'Sugar',
              'Fish sauce',
              'Vinegar',
              'Chili',
            ]
          : [
              'Thịt ba chỉ',
              'Thịt gò',
              'Bún',
              'Hành',
              'Tỏi',
              'Đường',
              'Nước mắm',
              'Giấm',
              'Ớt',
            ],
      steps: isEnglish
          ? [
              'Marinate pork belly and ground pork in a mixture of sugar, fish sauce, vinegar, garlic, and shallot.',
              'Grill the pork over charcoal until golden brown.',
              'Make the dipping sauce: sugar, fish sauce, vinegar, chili, and water.',
              'Cook vermicelli, rinse with cold water.',
              'Place vermicelli in a bowl, top with grilled pork, fresh herbs (lettuce, cilantro), and fried tofu.',
              'Pour the dipping sauce over the top.',
              'Enjoy while hot.',
            ]
          : [
              'Săm sả thịt ba chỉ và thịt gò, ngâm trong hỗn hợp đường, nước mắm, giấm, tỏi băm.',
              'Nướng thịt trên than cho tới vàng da.',
              'Làm nước mắm pha: đường, nước mắm, giấm, ớt, nước lọc vừa.',
              'Luộc bún, rửa nước lạnh.',
              'Đặt bún vào đĩa, cho thịt nướng, rau sống (xà lách, húng lủi) và các loại rau thơm.',
              'Rưới nước mắm pha lên trên.',
              'Thưởng thức nóng.',
            ],
      category: isEnglish ? 'Noodle' : 'Mì',
      difficulty: Difficulty.medium,
      prepTimeMinutes: 25,
      cookTimeMinutes: 20,
      tags: isEnglish
          ? ['pork', 'noodle', 'grilled', 'lunch', 'dinner']
          : ['heo', 'bún', 'nướng', 'bữa trưa', 'bữa tối'],
    ),
    Dish(
      id: '5',
      name: isEnglish ? 'Broken Rice' : 'Cơm Tấm',
      description: isEnglish
          ? 'Broken rice with grilled pork, shredded pork skin, and pickled vegetables.'
          : 'Cơm tấm với sườn nướng, trứng ịt, và rau sống.',
      imageUrl: 'lib/imgs/cơm-tấm.jpeg',
      ingredients: isEnglish
          ? [
              'Broken rice',
              'Grilled pork chop',
              'Steamed egg meatloaf',
              'Cucumber',
              'Tomato',
              'Scallion oil',
              'Fish sauce',
              'Sugar',
              'Vinegar',
              'Salt',
            ]
          : [
              'Cơm tấm',
              'Sườn nướng',
              'Trứng ịt',
              'Dưa leo',
              'Cà chua',
              'Hành phi',
              'Nước mắm',
              'Đường',
              'Dấm',
              'Muối',
            ],
      steps: isEnglish
          ? [
              'Marinate pork chops with sugar, fish sauce, minced garlic, and pepper for 30 minutes.',
              'Grill pork chops over charcoal until caramelized, then chop into pieces.',
              'Steam the egg meatloaf until golden on both sides.',
              'Place broken rice on a plate, top with grilled pork and egg meatloaf.',
              'Add cucumber slices, tomato wedges, scallion oil, and a few drops of fish sauce mixed with sugar and chili.',
              'Mix gently and enjoy.',
            ]
          : [
              'Ướp sườn với đường, nước mắm, tỏi băm và một chút tiêu trong 30 phút.',
              'Nướng sườn trên than cho tới caramelized, sau đó băm thành miếng.',
              'Chiên trứng ịt cho vàng hai mặt.',
              'Cho cơm tấm vào đĩa, xếp sườn nướng và trứng ịt lên trên.',
              'Thêm vài lát dưa leo, cà chua, hành phi và vài giọt nước mắm pha đường ớt.',
              'Trộn nhẹ và thưởng thức.',
            ],
      category: isEnglish ? 'Rice' : 'Cơм',
      difficulty: Difficulty.easy,
      prepTimeMinutes: 20,
      cookTimeMinutes: 15,
      tags: isEnglish
          ? ['rice', 'pork', 'egg', 'lunch', 'dinner']
          : ['cơm', 'heo', 'trứng', 'bữa trưa', 'bữa tối'],
    ),
    Dish(
      id: '6',
      name: isEnglish ? 'Hue Beef Noodle Soup' : 'Bún Bò Huế',
      description: isEnglish
          ? 'Spicy Hue-style beef noodle soup with beef shank, pork knuckle, and lemongrass.'
          : 'Súp bún bò Huế cay với đùi bò, heo, vàredients thơм.',
      imageUrl: 'lib/imgs/bún-bò-huế.jpeg',
      ingredients: isEnglish
          ? [
              'Beef shank',
              'Pork knuckle',
              'Lemongrass',
              'Fermented shrimp',
              'Onion',
              'Garlic',
              'Sugar',
              'Fish sauce',
              'Chili powder',
              'Cooking oil',
              'Rice vermicelli',
              'Banana blossom',
              'Water spinach',
              'Lime',
              'Cilantro',
            ]
          : [
              'Gò bò',
              'Heo knuckle',
              'Sả',
              'Tôm mắm',
              'Hành',
              'Tỏi',
              'Đường',
              'Nước mắm',
              'Ớt bột',
              'Dầu ăn',
              'Bún',
              'Hoa chuối',
              'Rau muống',
              'Chanh',
              'Húng lủi',
            ],
      steps: isEnglish
          ? [
              'Parboil beef shank and pork knuckle to remove impurities, then rinse.',
              'Bruise lemongrass stalks to release fragrance.',
              'Add meat and enough water, bring to a boil.',
              'Simmer on low heat for 1.5-2 hours until meat is tender.',
              'Remove meat, slice thinly. Strain the broth.',
              'In a pan, sauté fermented shrimp with a little oil, then add onion and garlic.',
              'Add this mixture to the broth, add sugar, fish sauce, and chili powder.',
              'Adjust seasoning with sugar, fish sauce, and chili oil.',
              'Cook vermicelli until tender.',
              'Place vermicelli in a bowl, add meat, banana blossom, and water spinach, then pour boiling broth over.',
              'Garnish with cilantro, scallions, and lime wedges.',
              'Enjoy while hot.',
            ]
          : [
              'Luộc gò bò và heo knuckle để loại bỏ tạp chất, rồi rửa sạch.',
              'Rang cho sả cho thơm.',
              'Thêm thịt và nước đủ màu, đun sôi.',
              'Hầm nhỏ trong 1,5-2 giờ tới khi thịt nhừ.',
              'Lấy thịt ra, lát mỏng. Lọc nước dùng.',
              'Trong chảo, phi thơm tôm mắm với một chút dầu, sau đó thêm hành và tỏi.',
              'Cho hỗn hợp này vào nước dùng, thêm đường, nước mắm, ớt bột.',
              'Điều chỉnh vị với đường, nước mắm, và dầu ớt.',
              'Luộc bún cho mềm.',
              'Đặt bún vào tô, thịt, hoa chuối, rau muống, rồi rót nước sôi lên trên.',
              'Rắc lá húng, ngò, và chanh.',
              'Thưởng thức nóng.',
            ],
      category: isEnglish ? 'Noodle' : 'Mì',
      difficulty: Difficulty.medium,
      prepTimeMinutes: 25,
      cookTimeMinutes: 120,
      tags: isEnglish
          ? [
              'beef',
              'pork',
              'noodle',
              'spicy',
              'soup',
              'lunch',
              'dinner',
              'Hue',
            ]
          : ['bò', 'heo', 'bún', 'cay', 'soup', 'bữa trưa', 'bữa tối', 'Huế'],
    ),
    Dish(
      id: '7',
      name: isEnglish ? 'Vietnamese Chicken Curry' : 'Cà Ri Gà',
      description: isEnglish
          ? 'Vietnamese chicken curry with rich, aromatic flavors.'
          : 'Cà ri gà Việt Nam với hương vị đậm đà.',
      imageUrl: 'lib/imgs/cà-ri-gà.jpg',
      ingredients: isEnglish
          ? [
              'Chicken',
              'Curry powder',
              'Coconut milk',
              'Potatoes',
              'Carrots',
              'Onion',
              'Garlic',
              'Fish sauce',
              'Sugar',
              'Salt',
            ]
          : [
              'Thịt gà',
              'Bột cà ri',
              'Nước cốt dừa',
              'Khoai tây',
              'Cà rốt',
              'Hành',
              'Tỏi',
              'Nước mắm',
              'Đường',
              'Muối',
            ],
      steps: isEnglish
          ? [
              'Wash chicken, cut into bite-sized pieces.',
              'In a pot, heat oil, sauté onion and garlic until fragrant.',
              'Add curry powder, stir well.',
              'Add chicken, coat evenly.',
              'Pour in coconut milk and water, just enough to cover.',
              'Add potato and carrot chunks.',
              'Bring to a boil, then reduce heat to simmer for 20-25 minutes.',
              'Season with fish sauce, sugar, and salt.',
              'Check potato tenderness.',
              'Serve in a bowl, accompanied by bread or steamed rice.',
            ]
          : [
              'Rửa gà, cắt miếng vừa ăn.',
              'Trong nồi, cho dầu, phi hành và tỏi cho tới thơm.',
              'Thêm bột cà ri, đảo đều.',
              'Cho gà vào, xót nhẹ.',
              'Thêm nước cốt dừa và nước, cho vừa ngập.',
              'Thêm khoai tây và cà rốt cắt khối.',
              'Đun sôi rồi reducir fuego để hầm nhẹ 20-25 phút.',
              'Nêm với nước mắm, đường, muối.',
              'Kiểm tra độ mềm của khoai tây.',
              'Đặt vào tô, ăn kèm với bánh mì hoặc cơм trắng.',
            ],
      category: isEnglish ? 'Rice' : 'Cơm',
      difficulty: Difficulty.medium,
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      tags: isEnglish
          ? ['chicken', 'curry', 'coconut milk', 'lunch', 'dinner']
          : ['gà', 'cà ri', 'coconut sữa', 'bữa trưa', 'bữa tối'],
    ),
    Dish(
      id: '8',
      name: isEnglish ? 'Nam Vang Noodle Soup' : 'Hủ Tiếu Nam Vang',
      description: isEnglish
          ? 'Nam Vang-style noodle soup with shrimp, ground pork, and clear broth.'
          : 'Hủ tiếu nam vang với tôm, thịt heo, và broth thanh đạm.',
      imageUrl: 'lib/imgs/hủ-tiếu-nam-vang.webp',
      ingredients: isEnglish
          ? [
              'Shrimp',
              'Ground pork',
              'Rice noodles',
              'Shallot',
              'Garlic',
              'Scallion',
              'Broth',
              'Fish sauce',
              'Sugar',
              'Salt',
            ]
          : [
              'Tôm',
              'Thịt heo băm',
              'Hủ tiếu',
              'Hành',
              'Tỏi',
              'Ngò',
              'Hành lá',
              'Nước dùng',
              'Nước mắm',
              'Đường',
              'Muối',
            ],
      steps: isEnglish
          ? [
              'Cook shrimp and ground pork until done.',
              'Heat broth with shallot and garlic until fragrant.',
              'Add shrimp and ground pork, season.',
              'Cook rice noodles until tender.',
              'Place noodles in a bowl, top with shrimp and pork.',
              'Add scallions and cilantro.',
              'Pour hot broth over.',
              'Add shrimp paste, chili, and lime to taste.',
              'Enjoy while hot.',
            ]
          : [
              'Luộc tôm và thịt heo cho tới chín.',
              'Đun nóng nước dùng với hành, tỏi cho tới thơм.',
              'Thêm tôm và thịt heo, nêm nếp.',
              'Luộc hủ tiếu cho tới vừa ăn.',
              'Đặt hủ tiếu vào tô, để trên đầu tôm, thịt.',
              'Thêm lá ngò, hành lá.',
              'Rưới nước dùng nóng lên trên.',
              'Thêm mắm tôm, ớt, chanh theo sở thích.',
              'Thưởng thức nóng.',
            ],
      category: isEnglish ? 'Noodle' : 'Mì',
      difficulty: Difficulty.medium,
      prepTimeMinutes: 20,
      cookTimeMinutes: 20,
      tags: isEnglish
          ? ['shrimp', 'pork', 'noodle', 'lunch', 'dinner']
          : ['tôm', 'heo', 'hủ tiếu', 'bữa trưa', 'bữa tối'],
    ),
  ];
}
