<?php
/**
 * This file is part of the Simple Web Demo Free Lottery Management Application.
 *
 * This project is no longer maintained.
 * The project is written in Symfony Framework Release.
 *
 * @link https://github.com/scorpion3dd
 * @author Denis Puzik <scorpion3dd@gmail.com>
 * @copyright Copyright (c) 2022-2023 scorpion3dd
 */

declare(strict_types=1);

namespace App\Repository;

use Doctrine\ORM\Query;

/**
 * Interface RolePermissionRepositoryInterface
 * @package App\Repository
 */
interface RolePermissionRepositoryInterface extends BaseRepositoryInterface
{
    /**
     * @param int $userId
     *
     * @return Query
     */
    public function findRolePermissionsBy(int $userId): Query;

    /**
     * @return Query
     */
    public function findRolePermissions(): Query;
}
