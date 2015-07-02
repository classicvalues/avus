-- | CWE functions and data
module Avus.CWE
    ( Id
    , cweImpact
    ) where

import           Avus.CVSSv2 (Base (..), Imp (..))

type Id = Int

-- We only need a mapping from CWE IDs to impacts,
-- partial (P) or complete (C), hence a CVSS Base-update function

partialConf :: [Id]
partialConf =
    [
    103, 104, 108, 257, 330, 483, 656, 768, 782, 783,
    923, 924
    ]

completeConf :: [Id]
completeConf =
    [
    5, 7, 8, 11, 12, 14, 20, 22, 23, 24,
    25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
    35, 36, 37, 38, 39, 40, 41, 43, 44, 45,
    46, 47, 48, 49, 50, 51, 52, 53, 54, 55,
    56, 57, 58, 59, 61, 62, 64, 65, 67, 71,
    72, 73, 74, 75, 77, 78, 79, 80, 81, 82,
    83, 85, 86, 87, 88, 89, 90, 91, 94, 95,
    96, 97, 98, 99, 114, 116, 117, 119, 120, 121,
    122, 123, 124, 125, 126, 127, 128, 129, 131, 134,
    135, 138, 146, 170, 174, 188, 190, 191, 193, 194,
    196, 200, 201, 202, 203, 204, 205, 206, 207, 208,
    209, 210, 211, 212, 213, 214, 215, 219, 220, 226,
    234, 243, 244, 248, 250, 272, 276, 277, 278, 279,
    281, 285, 287, 296, 299, 300, 304, 311, 312, 313,
    314, 315, 316, 317, 318, 319, 322, 325, 326, 327,
    329, 347, 352, 359, 360, 362, 363, 364, 368, 370,
    377, 378, 379, 385, 386, 402, 403, 404, 415, 416,
    425, 426, 427, 428, 433, 434, 459, 466, 467, 468,
    469, 470, 476, 479, 486, 487, 488, 489, 492, 493,
    494, 497, 499, 500, 506, 507, 508, 509, 510, 512,
    514, 515, 524, 525, 526, 527, 528, 529, 530, 531,
    532, 533, 534, 535, 536, 537, 538, 539, 540, 541,
    542, 545, 548, 550, 552, 553, 560, 564, 566, 567,
    578, 583, 587, 590, 591, 593, 598, 599, 600, 601,
    605, 608, 610, 611, 612, 614, 615, 616, 619, 623,
    624, 627, 638, 641, 642, 643, 644, 646, 647, 648,
    650, 651, 652, 662, 663, 665, 668, 669, 672, 674,
    680, 682, 689, 692, 698, 703, 706, 708, 732, 749,
    756, 761, 762, 763, 766, 777, 781, 785, 786, 787,
    788, 798, 805, 806, 807, 820, 821, 822, 823, 824,
    825, 826, 827, 828, 829, 830, 831, 832, 838, 839,
    862, 863, 908, 909, 910, 917, 918, 921, 922, 926,
    927, 942, 943
    ]

partialInteg :: [Id]
partialInteg =
    [
    74, 84, 102, 103, 104, 105, 106, 108, 112, 115,
    140, 141, 142, 143, 144, 145, 147, 148, 149, 150,
    151, 152, 153, 154, 155, 156, 157, 158, 159, 160,
    161, 162, 163, 164, 165, 167, 172, 175, 176, 177,
    187, 195, 198, 227, 228, 229, 230, 231, 232, 233,
    235, 236, 237, 238, 239, 240, 241, 252, 253, 295,
    298, 299, 345, 353, 362, 365, 366, 372, 378, 390,
    391, 392, 393, 394, 410, 430, 435, 436, 437, 444,
    456, 457, 478, 482, 483, 489, 491, 511, 515, 544,
    554, 580, 581, 586, 605, 611, 622, 626, 640, 649,
    656, 681, 696, 703, 754, 764, 768, 782, 783, 790,
    791, 792, 793, 794, 795, 796, 797, 912, 923, 924,
    925, 927
    ]

completeInteg :: [Id]
completeInteg =
    [
    5, 8, 20, 22, 23, 24, 25, 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
    39, 40, 41, 43, 44, 45, 46, 47, 48, 49,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
    61, 62, 64, 65, 71, 72, 73, 75, 77, 78,
    79, 80, 81, 82, 83, 85, 86, 87, 88, 89,
    90, 91, 93, 94, 95, 96, 97, 98, 99, 113,
    114, 116, 117, 119, 120, 121, 122, 123, 124, 128,
    129, 131, 134, 135, 138, 146, 170, 174, 179, 188,
    190, 191, 193, 194, 196, 197, 234, 250, 276, 277,
    278, 279, 281, 285, 287, 296, 300, 304, 311, 319,
    325, 327, 329, 347, 349, 352, 354, 360, 363, 364,
    367, 368, 370, 374, 375, 377, 386, 403, 413, 414,
    415, 416, 425, 426, 427, 428, 432, 434, 453, 454,
    455, 459, 464, 466, 467, 468, 469, 470, 471, 472,
    473, 476, 479, 486, 487, 493, 494, 495, 496, 500,
    502, 506, 507, 508, 509, 510, 543, 545, 552, 553,
    558, 560, 564, 566, 567, 578, 582, 583, 587, 588,
    590, 594, 607, 608, 609, 610, 616, 619, 621, 623,
    624, 627, 638, 641, 644, 648, 650, 662, 663, 668,
    669, 672, 680, 682, 689, 692, 698, 706, 708, 732,
    749, 761, 762, 763, 765, 766, 767, 781, 785, 786,
    787, 788, 798, 805, 806, 820, 821, 822, 823, 824,
    825, 826, 827, 828, 829, 830, 831, 832, 838, 839,
    862, 863, 913, 914, 915, 917, 918, 921, 922, 926,
    942, 943
    ]

partialAvail :: [Id]
partialAvail =
    [
    103, 104, 108, 194, 457, 463, 482, 483, 489, 656,
    768, 777, 782, 783, 807, 943
    ]

completeAvail :: [Id]
completeAvail =
    [
    20, 22, 23, 36, 39, 67, 73, 75, 77, 78,
    79, 80, 81, 82, 83, 85, 86, 87, 88, 90,
    91, 94, 95, 96, 97, 98, 114, 116, 117, 119,
    120, 121, 122, 123, 124, 128, 129, 131, 134, 135,
    138, 146, 166, 168, 170, 174, 190, 191, 193, 196,
    228, 234, 248, 250, 252, 253, 287, 296, 332, 333,
    352, 360, 362, 364, 369, 382, 395, 400, 401, 404,
    405, 406, 407, 408, 409, 410, 412, 413, 414, 415,
    416, 425, 426, 427, 428, 434, 469, 470, 476, 479,
    486, 494, 502, 506, 507, 508, 509, 510, 545, 553,
    562, 567, 578, 583, 587, 588, 590, 594, 600, 602,
    606, 611, 617, 623, 624, 627, 638, 640, 641, 642,
    644, 645, 646, 648, 665, 667, 672, 674, 680, 682,
    690, 692, 698, 703, 749, 754, 761, 762, 763, 764,
    765, 770, 771, 772, 773, 774, 775, 776, 779, 781,
    785, 786, 787, 788, 789, 798, 799, 805, 806, 822,
    823, 824, 825, 826, 827, 828, 829, 830, 831, 832,
    833, 834, 835, 838, 839, 908, 909, 910, 920, 926,
    942
    ]

cweImpact :: Id -> Base -> Base
cweImpact i = (confImpact i) . (integImpact i) . (availImpact i)

confImpact :: Id -> Base -> Base
confImpact i b
  | i `elem` completeConf = b { c = ImpC }
  | i `elem` partialConf  = b { c = ImpP }
  | otherwise             = b

integImpact :: Id -> Base -> Base
integImpact i b
  | i `elem` completeInteg = b { i = ImpC }
  | i `elem` partialInteg  = b { i = ImpP }
  | otherwise              = b

availImpact :: Id -> Base -> Base
availImpact i b
  | i `elem` completeAvail = b { a = ImpC }
  | i `elem` partialAvail  = b { a = ImpP }
  | otherwise              = b
