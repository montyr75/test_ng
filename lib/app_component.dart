import 'dart:html';
import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/model/selection/select.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/selection/selection_options.dart';

import 'src/org_tree/renderers/org_node_renderer.dart';
import 'src/org_tree/org_tree.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, OrgTree],
  providers: const [materialProviders],
  pipes: const [COMMON_PIPES]
)
class AppComponent {
  Map orgRef = {
    "Coruscant" : {
      "Jedi Temple" : {
        "_goals" : {
          "power" : 2000
        },
        "_guid" : "{f9a61938-5824-473c-afb8-e8f2eeb14c68}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "CHW" : {
              "_guid" : "{822a587c-65e3-45e4-94e4-37d99979a704}",
              "_type" : "commercial"
            },
            "HTW" : {
              "_guid" : "{34f61b44-b8c6-40a8-b58b-32bace35eabb}",
              "_type" : "commercial"
            }
          },
          "_power" : {
            "MODDROP-IP-USU" : {
              "_guid" : "{BLOCK-VUTILITI-KODY-MODDROP-TCPIP-USU-TEST-01}",
              "_type" : "hotdrop"
            },
            "Main Power" : {
              "_guid" : "{a3b08aa5-285a-4f86-8914-b2a57aaad51c}",
              "_type" : "commercial"
            }
          },
          "_water" : {
            "Domestic HTW" : {
              "_guid" : "{715ed6f0-a2dd-4e94-8b5d-02b37a8c1aab}",
              "_type" : "commercial"
            },
            "Domestic Water" : {
              "_guid" : "{5e515dea-452d-48b8-a460-d0783dd51305}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "Senate Stadium" : {
        "_guid" : "{218c730f-6a36-41ce-a9f5-9c52d8378078}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "Main Gas" : {
              "_guid" : "{4c47edfe-d72e-4e61-a79a-21955bc1f073}",
              "_submeters" : {
                "East Gas" : {
                  "_guid" : "{fb9ef615-96bc-4cae-9439-0982cd8bff47}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                },
                "North Gas" : {
                  "_guid" : "{90e37a03-2eca-4998-a2df-b4cf9c78c160}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                },
                "South Gas" : {
                  "_guid" : "{7af19d86-f692-449b-9a94-a5dbe7a814af}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                }
              },
              "_type" : "commercial"
            }
          },
          "_power" : {
            "Main Power" : {
              "_guid" : "{efd3d54d-5c64-4462-be84-dca7c2770f4f}",
              "_type" : "commercial"
            }
          },
          "_water" : {
            "East Water" : {
              "_guid" : "{a8fd8084-7482-4542-834b-19b176a2617b}",
              "_type" : "commercial"
            },
            "Main Water" : {
              "_guid" : "{c992063e-b585-46d9-aee5-33a8e133226c}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "_guid" : "{d47f3401-5519-4457-9945-f44052f4f396}",
      "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
      "_type" : "container"
    },
    "Endor" : {
      "Endor Moon" : {
        "_guid" : "{eb40f37b-f4fa-448b-b9ca-0633e24bb46c}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "Main Gas" : {
              "_guid" : "{9e50c4a3-a866-46f4-a952-cfd8d02abf09}",
              "_submeters" : {
                "Boiler 1" : {
                  "_guid" : "{27de432e-274f-460f-b1f3-cf5fde7a4d55}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                },
                "Boiler 2" : {
                  "_guid" : "{2db8ddde-d001-40f8-926e-d34057b41246}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                },
                "Boiler 3" : {
                  "_guid" : "{eefaecc7-7b11-4110-b8c1-5fb64a6d5df9}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                },
                "Boiler 4" : {
                  "_guid" : "{75064377-844f-4155-bea6-f9caea365832}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                },
                "Steam Flow" : {
                  "_guid" : "{638c376b-6847-4a72-b30a-ca14e525b581}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                },
                "Steam Total" : {
                  "_guid" : "{f2e09c8e-d9a5-4599-9024-f5c714419b26}",
                  "_icon" : "gas",
                  "_type" : "commercial"
                }
              },
              "_type" : "commercial"
            }
          },
          "_power" : {
            "Main Power" : {
              "_guid" : "{a1c0f971-f09b-43b6-9fd3-d3761fae1b57}",
              "_type" : "commercial"
            },
            "OutDoor Lights" : {
              "_guid" : "{2d8faa46-6093-4991-af0f-f1df86a67955}",
              "_type" : "commercial"
            },
            "Secondary Power" : {
              "_guid" : "{cd411bf9-a19d-41d0-a247-1ab88c7eb084}",
              "_type" : "commercial"
            },
            "Shield Generator" : {
              "_guid" : "{4764d5e8-b688-41bd-b95c-1e3cdf0faea7}",
              "_type" : "commercial"
            }
          },
          "_solar" : {
            "SJQ" : {
              "_guid" : "{8d94a375-4898-4543-74db-38a04efb788e}",
              "_type" : "solar"
            },
            "SLC1" : {
              "_guid" : "{01983d55-93d5-4c70-60bb-410982f0c657}",
              "_type" : "solar"
            },
            "SLC10" : {
              "_guid" : "{62c7d35a-55e8-4c10-47f2-6d4f0dc7ea4b}",
              "_type" : "solar"
            },
            "SLC13" : {
              "_guid" : "{3bc6c778-a6b7-47d4-5599-3c25c7babf03}",
              "_type" : "solar"
            },
            "SLC7" : {
              "_guid" : "{95d775b2-6cf4-4911-7921-c6cddc4b247d}",
              "_type" : "solar"
            }
          },
          "_water" : {
            "Domestic Water" : {
              "_guid" : "{7a49f398-152a-4db1-bcd9-1b6741cad6b5}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "Ewok Village" : {
        "_guid" : "{8d75f67d-9934-4082-9363-4d7e9bf81145}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "gas" : {
              "_guid" : "{7b97395a-ef8d-49bd-a9bb-7c9f1d443bc4}",
              "_type" : "commercial"
            }
          },
          "_water" : {
            "Domestic Water" : {
              "_guid" : "{ba2fb90a-df2e-485e-a249-43ca14b0fd52}",
              "_type" : "commercial"
            },
            "Tower Water" : {
              "_guid" : "{0d685c41-9708-43a5-8e78-5788f4f4950e}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "_guid" : "{647ddcc5-36ef-4e94-9ae2-28363334e530}",
      "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
      "_type" : "container"
    },
    "Naboo" : {
      "Device X" : {
        "_goals" : {
          "power" : 25000
        },
        "_guid" : "{816c2a83-a98f-4c05-907f-9929338bcf6c}",
        "_type" : "sundrop",
        "_uid" : "dev3b-00000000db6edb46"
      },
      "Otoh Gunga Council Chamber" : {
        "_goals" : {
          "power" : 510
        },
        "_guid" : "{c0148d6b-86ec-4231-a87a-ba92ab784a40}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "Gas 1" : {
              "_guid" : "{ea06780a-06a3-4d69-8aa6-400ba47ac311}",
              "_type" : "commercial"
            },
            "Hot Water 1" : {
              "_guid" : "{04029905-b9d4-4dd8-b365-0a0aec4e6155}",
              "_type" : "commercial"
            },
            "Hot Water 2" : {
              "_guid" : "{9321af6d-6932-4f9e-aca4-f96de4c731df}",
              "_type" : "commercial"
            },
            "Hot Water 3" : {
              "_guid" : "{147a3a03-df3a-4209-b535-2cb526595754}",
              "_type" : "commercial"
            },
            "Hot Water 4" : {
              "_guid" : "{4b37e3a5-ce07-494e-8701-cd577f0d5376}",
              "_type" : "commercial"
            }
          },
          "_power" : {
            "Power 1" : {
              "_guid" : "{8f53b586-63c0-4439-b8ba-7d6ec333b5e7}",
              "_type" : "commercial"
            }
          },
          "_water" : {
            "Cold Water 1" : {
              "_guid" : "{ac1270a1-e780-4ff7-acc4-9d200ae18c80}",
              "_type" : "commercial"
            },
            "Cold Water 2" : {
              "_guid" : "{da25120e-02ef-4a58-ab6f-e1e901f27193}",
              "_type" : "commercial"
            },
            "Domestic Water" : {
              "_guid" : "{cbeaf89b-105d-444a-8303-7f194dfd006b}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "_guid" : "{bf98b206-0eed-4692-9795-88d80462b050}",
      "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
      "_type" : "container"
    },
    "Tattoine" : {
      "Lars Homestead" : {
        "_guid" : "{31d70060-5724-4844-8143-6f9c1052ba07}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "EH Chilled Water 1" : {
              "_guid" : "{8cafa729-79d2-43f4-b545-4501b8a466b9}",
              "_type" : "commercial"
            },
            "EH Gas 2" : {
              "_guid" : "{c99a1561-07a2-48fc-a3a6-e5213361f6d5}",
              "_type" : "commercial"
            },
            "EH Gas 3" : {
              "_guid" : "{43569c66-abb1-43ce-bba5-295edbca75c6}",
              "_type" : "commercial"
            },
            "EH Hot Water 1" : {
              "_guid" : "{5aa797f2-8603-44f9-ad75-b2172ec79292}",
              "_type" : "commercial"
            }
          },
          "_power" : {
            "EH Power 1" : {
              "_guid" : "{c06956ca-f102-4d71-885e-50a280a7cbe7}",
              "_type" : "commercial"
            },
            "EH Power 2" : {
              "_guid" : "{c81d7284-8fcc-4ae5-9a8a-e35104e789ba}",
              "_type" : "commercial"
            }
          },
          "_water" : {
            "EH Water 1" : {
              "_guid" : "{6a15d776-88e3-4323-bf3d-abe82d1498f5}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "Mos Espa Arena" : {
        "_guid" : "{6df4eae1-a055-4c2a-9ea8-26b3a6715be5}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "DB Chilled Water 1" : {
              "_guid" : "{9626ec9f-25c9-452d-b527-f6940d6e37c9}",
              "_type" : "commercial"
            },
            "DB Hot Water 1" : {
              "_guid" : "{58424cd4-583d-4357-bf92-b755e3a06ac2}",
              "_type" : "commercial"
            },
            "UL Gas 1" : {
              "_guid" : "{ec071ba9-ae0e-4e2c-ae82-243cc78e75a7}",
              "_type" : "commercial"
            }
          },
          "_power" : {
            "UL Power 1" : {
              "_guid" : "{5b71c588-ebbf-42b3-a59e-380c30e25b79}",
              "_type" : "commercial"
            }
          },
          "_solar" : {
            "Main Solar" : {
              "_guid" : "{56bb9556-4f2f-4329-a22b-5aead917f0d1}",
              "_submeters" : {
                "UL North Solar Panels" : {
                  "_guid" : "{201a6e5c-7271-422f-a46b-f678e6bf6292}",
                  "_icon" : "solar-panels",
                  "_type" : "commercial"
                },
                "UL South Solar Panels" : {
                  "_guid" : "{b87ae606-024e-400f-878b-e7dff4378b91}",
                  "_icon" : "solar-panels",
                  "_type" : "commercial"
                }
              },
              "_type" : "commercial"
            }
          },
          "_water" : {
            "Domestic Water" : {
              "_guid" : "{2ba9b323-9f4d-4765-a2e2-7cf07a4d3e90}",
              "_type" : "commercial"
            },
            "Kitchen Cold Water" : {
              "_guid" : "{70084180-0f46-4cc2-b530-0efbcb0e6c5b}",
              "_type" : "commercial"
            },
            "Kitchen Hot Water" : {
              "_guid" : "{b3770650-d175-4386-9b6b-f62874137235}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "Watto's Junkshop" : {
        "_guid" : "{9bea2235-9902-4949-ae94-67a77a57a331}",
        "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
        "_meters" : {
          "_gas" : {
            "ML Chilled Water 1" : {
              "_guid" : "{a0f484e4-7799-43e3-bacc-337940d3563d}",
              "_type" : "commercial"
            },
            "ML Gas 1" : {
              "_guid" : "{f8f77dd4-fa87-44b8-a18d-b9d7a0703f6f}",
              "_type" : "commercial"
            },
            "ML Hot Water 1" : {
              "_guid" : "{53ca22c6-c888-495b-8700-08630cdbfcea}",
              "_type" : "commercial"
            }
          },
          "_power" : {
            "ML Power 1" : {
              "_guid" : "{96f0a43f-8603-48e9-ae1c-3cc1dcb4946d}",
              "_type" : "commercial"
            }
          },
          "_solar" : {
            "ML Solar Panels" : {
              "_guid" : "{d0b1479f-ee0d-4e97-a5a0-c59bac0fb0ac}",
              "_type" : "commercial"
            }
          },
          "_water" : {
            "ML Water 1" : {
              "_guid" : "{205377d6-060e-43ad-ab09-fef712f47c25}",
              "_type" : "commercial"
            }
          }
        },
        "_type" : "building"
      },
      "_goals" : {
        "power" : 30
      },
      "_guid" : "{3df4d4d9-a5e3-4b71-859e-7fcf8e790100}",
      "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
      "_type" : "container"
    },
    "_goals" : {
      "gas" : 5000,
      "power" : 32000,
      "water" : 0
    },
    "_guid" : "{63c5c144-aac1-4ad7-b8a6-9f8f64ab2628}",
    "_image" : "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
    "_type" : "org"
  };

  SelectionOptions nestedOptions = new _NestedSelectionOptions([
    new OptionGroup(
      ['Animated Feature Films', 'Live-Action Films', 'Documentary Films'])
  ], {
    'Animated Feature Films': [
      new OptionGroup(
        ['Cinderella', 'Alice In Wonderland', 'Peter Pan', 'Lady and the Tramp'
        ])
    ],
    'Live-Action Films': [
      new OptionGroup(
        ['Treasure Island', 'The Littlest Outlaw', 'Old Yeller', 'Star Wars'])
    ],
    'Documentary Films': [
      new OptionGroup(['Frank and Ollie', 'Sacred Planet'])
    ],
    'Star Wars': [
      new OptionGroup(['By George Lucas'])
    ],
    'By George Lucas': [
      new OptionGroup(
        ['A New Hope', 'Empire Strikes Back', 'Return of the Jedi'])
    ]
  });

//  final SelectionModel singleSelection = new SelectionModel.withList();

//  OptionGroup topLevel;
//  Map<Map, List<OptionGroup<Map>>> children;

  AppComponent() {
//    topLevel = new OptionGroup([
//      {
//        "_name": "Coruscant",
//        "_guid": "{d47f3401-5519-4457-9945-f44052f4f396}",
//        "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//        "_type": "container"
//      },
//      {
//        "_name": "Endor",
//        "_guid": "{647ddcc5-36ef-4e94-9ae2-28363334e530}",
//        "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//        "_type": "container"
//      }
//    ]);


//    children = {
//      topLevel[0]: [new OptionGroup<Map>([
//        {
//          "_name": "Jedi Temple",
//          "_guid": "{f9a61938-5824-473c-afb8-e8f2eeb14c68}",
//          "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//          "_type": "building"
//        },
//        {
//          "_name": "Senate Stadium",
//          "_guid": "{218c730f-6a36-41ce-a9f5-9c52d8378078}",
//          "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//          "_type": "building"
//        }
//      ])],
//      topLevel[1]: [new OptionGroup<Map>([
//        {
//          "_name": "Endor Moon",
//          "_guid": "{eb40f37b-f4fa-448b-b9ca-0633e24bb46c}",
//          "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//          "_type": "building"
//        }
//      ])],
//      topLevel[2]: [new OptionGroup<Map>([
//        {
//          "_name": "Jedi Temple",
//          "_guid": "{f9a61938-5824-473c-afb8-e8f2eeb14c68}",
//          "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//          "_type": "building"
//        },
//        {
//          "_name": "Senate Stadium",
//          "_guid": "{218c730f-6a36-41ce-a9f5-9c52d8378078}",
//          "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//          "_type": "building"
//        }
//      ])],
//      topLevel[3]: [new OptionGroup<Map>([
//        {
//          "_name": "Endor Moon",
//          "_guid": "{eb40f37b-f4fa-448b-b9ca-0633e24bb46c}",
//          "_image": "https://firebasestorage.googleapis.com/v0/b/firebase-vutiliti-platform.appspot.com/o/images%2Forgs%2Fbuildings%2Fbuilding_placeholder.png?alt=media&token=621de6e4-568d-4e1f-9676-b4e53e9479d7",
//          "_type": "building"
//        }
//      ])],
//    };


//    nestedOptions = new _NestedSelectionOptions<Map>([new OptionGroup<Map>(topLevel)], children);

//    createOptions(orgRef);
//    _createOptions(orgRef['Endor']['Endor Moon']);
  }

//  Type compRenderer(var item) {
//    return OrgNodeRenderer;
//  }

//  void _createOptions(Map org) {
//    children = {};
//
//    if (org['_type'] == "org" || org['_type'] == "container") {
//      topLevel = new OptionGroup([]);
//
//      for (String key in org.keys) {
//        var value = org[key];
//
//        if (!key.startsWith("_")) {
//          value["_name"] = key;
//          topLevel.add(value);
//        }
//      }
//
//      topLevel.forEach((Map node) {
//        _discoverChildNodes(node);
//      });
//    }
//    else if (org['_type'] == "building") {
//      org["_name"] = "Building";
//      topLevel = new OptionGroup([org]);
//      _discoverMeters(org);
//    }
//
//    nestedOptions = new _NestedSelectionOptions<Map>([topLevel], children);
//  }
//
//  void _discoverChildNodes(Map node) {
//    for (String key in node.keys) {
//      var value = node[key];
//
//      if (!key.startsWith("_")) {
//        value["_name"] = key;
//
//        if (children[node] == null) {
//          children[node] = [new OptionGroup([value])];
//        }
//        else {
//          children[node].first.add(value);
//        }
//
//        // make sure parent has a reference to this option group for adding new nodes
//        scheduleMicrotask(() => node["_optionGroup"] ??= children[node].first);
//
//        // process and add any meters
//        if (value['_type'] == "building") {
//          _discoverMeters(value);
//        }
//        else {
//          // TODO: Run discoverChildNodes() recursively on node types that need it (maybe just containers?)
//        }
//      }
//    }
//  }
//
//  void _discoverMeters(Map node) {
//    if (node.containsKey("_meters")) {
//      Map metersNode = node["_meters"];
//
//      for (String utilityType in metersNode.keys) {
//        if (utilityType != "init") {
//          metersNode[utilityType].forEach((String meterName, Map meterMap) {
//            meterMap["_name"] = meterName;
//            meterMap["_utilityType"] = utilityType.substring(1);
//            meterMap["_isSubmeter"] = false;
//
//            if (children[node] == null) {
//              children[node] = [new OptionGroup([meterMap])];
//            }
//            else {
//              children[node].first.add(meterMap);
//            }
//
//            // make sure parent has a reference to this option group for adding new nodes
//            scheduleMicrotask(() => node["_optionGroup"] ??= children[node].first);
//
//            // process and add any submeters
//            if (meterMap.containsKey("_submeters")) {
//              Map submetersNode = meterMap["_submeters"];
//
//              submetersNode.forEach((String submeterName, Map submeterMap) {
//                submeterMap["_name"] = submeterName;
//                submeterMap["_utilityType"] = utilityType.substring(1);
//                submeterMap["_isSubmeter"] = true;
//
//                if (children[meterMap] == null) {
//                  children[meterMap] = [new OptionGroup([submeterMap])];
//                }
//                else {
//                  children[meterMap].first.add(submeterMap);
//                }
//
//                // make sure parent has a reference to this option group for adding new nodes
//                scheduleMicrotask(() => meterMap["_optionGroup"] ??= children[meterMap].first);
//              });
//            }
//          });
//        }
//      }
//    }
//  }
}

/// An example implementation of [SelectionOptions] with [Parent].
class _NestedSelectionOptions<T> extends SelectionOptions<T> implements Parent<T, List<OptionGroup<T>>> {
  final Map<T, List<OptionGroup<T>>> _children;

  _NestedSelectionOptions(List<OptionGroup<T>> options, this._children) : super(options);

  @override
  bool hasChildren(T item) => _children.containsKey(item);

  @override
  DisposableFuture<List<OptionGroup<T>>> childrenOf(T parent, [_]) {
    return new DisposableFuture<List<OptionGroup<T>>>.fromValue(_children[parent]);
  }
}
