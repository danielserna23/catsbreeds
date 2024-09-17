import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/infrastructure/models/cat_breeds_response.dart';

class CatMapper {
  static Cat catToEntity(CatBreedsResponse cats) => Cat(
        id: cats.id,
        name: cats.name,
        temperament: cats.temperament,
        origin: cats.origin,
        countryCodes: cats.countryCodes,
        countryCode: cats.countryCode,
        description: cats.description,
        lifeSpan: cats.lifeSpan,
        indoor: cats.indoor,
        adaptability: cats.adaptability,
        affectionLevel: cats.affectionLevel,
        childFriendly: cats.childFriendly,
        catFriendly: cats.catFriendly,
        dogFriendly: cats.dogFriendly,
        energyLevel: cats.energyLevel,
        grooming: cats.grooming,
        healthIssues: cats.healthIssues,
        intelligence: cats.intelligence,
        sheddingLevel: cats.sheddingLevel,
        socialNeeds: cats.socialNeeds,
        strangerFriendly: cats.strangerFriendly,
        vocalisation: cats.vocalisation,
        experimental: cats.experimental,
        hairless: cats.hairless,
        natural: cats.natural,
        rare: cats.rare,
        rex: cats.rex,
        suppressedTail: cats.suppressedTail,
        shortLegs: cats.shortLegs,
        hypoallergenic: cats.hypoallergenic,
        referenceImageId: cats.referenceImageId!,
      );
}
